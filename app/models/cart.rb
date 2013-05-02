class Cart < ActiveRecord::Base
  attr_accessible :session_id, :ammount
  has_many :cart_items, dependent: :destroy
# kalo cart kehapus maka cart item kehapus juga
end
