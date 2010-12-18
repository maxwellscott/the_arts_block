# == Schema Information
# Schema version: 20101116070400
#
# Table name: events
#
#  id          :integer         not null, primary key
#  performer   :string(255)
#  date        :string(255)
#  time        :string(255)
#  description :text
#  image_url   :string(255)
#  price       :decimal(8, 2)
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
  default_scope :order => 'utc'
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors[:base] << "Line Items present"
      return false
    end
  end

  validates :performer, :date, :time, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.00}
  validates :performer, :uniqueness => {:scope => :date}
  validates :image_url, :format => {
    :with    => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }

  def title  
    title = performer + ' '  
    title += date
    title  
  end

end
