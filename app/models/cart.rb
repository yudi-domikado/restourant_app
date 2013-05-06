class Cart < ActiveRecord::Base
  attr_accessible :session_id, :ammount
  has_many :cart_items, dependent: :destroy

# kalo cart kehapus maka cart item kehapus juga


 def self.add_item (session_cart,params) #() <-- yang ada di controller tapi ga ada di model
 		cart = find_or_create_by_session_id(session_cart)	
		cart_item = cart.cart_items.find_or_initialize_by_food_id(params[:food_id]) # cara untuk memanggil relasi 						
		# @cart_item.quantity += params[:quantity].to_i
		cart_item.quantity = cart_item.quantity.to_i + params[:quantity].to_i
		cart_item.price = cart_item.food.price # manggil cart_item relasi food kolum harga
		cart_item.save
		cart_item
 end


# @ variable baru

end
