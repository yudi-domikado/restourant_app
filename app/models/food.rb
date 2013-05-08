class Food < ActiveRecord::Base
  attr_accessible :name, :price, :quantity, :unlimited, :picture, :category_id, :tag_list
  belongs_to :category
  has_many :cart_items
  has_many :order_items
  acts_as_taggable

  validates_numericality_of :quantity, :null => false, :greater_than_or_equal_to => 0
  

  #paperclip
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
def self.search(search) #search yang didalam kurung adalah parameter yang di controller
    if search
      return where(['name LIKE ? OR price LIKE ? OR quantity LIKE ? '  , "%#{search}%","%#{search}%","%#{search}%"]) # dikasih pagar biar kecetak di sql
    else
      return find(:all)
    end
end




end
