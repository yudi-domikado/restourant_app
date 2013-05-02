class CartItem < ActiveRecord::Base
  attr_accessible :cart_id, :food_id, :quantity, :price
  belongs_to :food
  belongs_to :cart
end
