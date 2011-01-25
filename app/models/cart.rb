class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/paypal_cert.pem")  
  APP_CERT_PEM = File.read("#{Rails.root}/certs/app_cert.pem")  
  APP_KEY_PEM = File.read("#{Rails.root}/certs/app_key.pem")  

  def add_event(event_id)
    current_item = line_items.where(:event_id => event_id).first
    if current_item
      current_item.quantity += 1
    else
      current_item = LineItem.new(:event_id=>event_id)
      line_items << current_item
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def total_items
    line_items.sum(:quantity)
  end

  def paypal_encrypted(return_url, notify_url)  
    values = {  
      :business => "paypal@artsandmusicfactory.com",
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,  
      :invoice => id,  
      :cert_id => "BYD8H3TQBYY7J",
      :notify_url => notify_url
    }  
      
    line_items.each_with_index do |item, index|  
      values.merge!({  
        "amount_#{index + 1}" => item.event.price,  
        "item_name_#{index + 1}" => item.event.name,  
        "item_number_#{index + 1}" => item.event.id,  
        "quantity_#{index + 1}" => item.quantity  
      })  
    end  
    encrypt_for_paypal(values)  
  end

  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end
end
