class Food < ActiveRecord::Base
  attr_accessible :name, :price, :quantity, :unlimited, :picture
  has_many :cart_items
  has_many :order_items
  
  #paperclip
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

end
