class Food < ActiveRecord::Base
  attr_accessible :name, :price, :quantity, :unlimited, :picture
  has_many :cart_items
  has_many :order_items
  
  validates_numericality_of :quantity, :null => false, :greater_than_or_equal_to => 0
  
  # validate :validate_quantity
 
  # def quantity
  #   self[:quantity] || 1.0 / 0
  # end
 
  # def quantity_remaining
  #   quantity - cart_items.quantity
  # end
 
  # private
 
  #   def validate_quantity
  #     return true if new_record?
  #     if quantity_remaining <= 0
  #       errors.add(:base, :exceeded_quantity)
  #     end
  #   end
  #paperclip
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  







end
