class PaymentNotification < ActiveRecord::Base
  after_save :mark_cart_as_purchased  
  belongs_to :cart
  serialize :params  
    
private  
  def mark_cart_as_purchased  
    if status == "Completed"
      cart.update_attribute(:purchased_at => Time.now)  
    end  
  end
end
