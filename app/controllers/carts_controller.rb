class CartsController < ApplicationController
	
	def index
		@cart = Cart.find_or_create_by_session_id(session_cart)	
	end

	def create
		@cart = Cart.find_or_create_by_session_id(session_cart)	
		@cart_item = @cart.cart_items.find_or_initialize_by_food_id(params[:food_id]) # cara untuk memanggil relasi 						
		# @cart_item.quantity += params[:quantity].to_i
		@cart_item.quantity = @cart_item.quantity.to_i + params[:quantity].to_i
		@cart_item.price = @cart_item.food.price # manggil cart_item relasi food kolum harga
		@cart_item.save
		redirect_to carts_path
	end

	def update

		@cart = Cart.find(params[:cart_item_id])
		@cart.update_attributes(params[:ammount])
	end

	def destroy

		@cart = Cart.find(params[:cart_item_id])
		@cart.destroy
	end

	def show
		redirect_to carts_path
	end

end

#setiap session_cart dipanggil menggunakan method yang di private

# contoh perumpamaan
# @munchen = club.find (1)
# @players = @munchen.players
# @robben = @players.find_by_name("robben")
