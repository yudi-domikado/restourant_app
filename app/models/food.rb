class Food < ActiveRecord::Base
  attr_accessible :name, :price, :quantity, :unlimited, :picture
  has_many :cart_items
  has_many :order_items
  validates_numericality_of :quantity, :null => false, :greater_than_or_equal_to => 0
  

  #paperclip
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
def self.search(search) #search yang didalam kurung adalah parameter yang di controller
    if search
      return where(['name LIKE ?'  , "%#{search}%"]) # dikasih pagar biar kecetak di sql
      return where(['price LIKE ?' , "%#{search}%"])
      return where(['quantity LIKE ?',"%#{search}%"])
    else
      return find(:all)
    end
end




end
