class OrderItem < ActiveRecord::Base
	belongs_to :food
	belongs_to :order
  attr_accessible :quantity, :price, :food_id
end
