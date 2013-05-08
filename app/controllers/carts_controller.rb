class CartsController < ApplicationController
	
	def index
		@cart = Cart.find_or_create_by_session_id(session_cart)	
		# @cart = Cart.order(:id).page(params[:page]).per(3)
	end

	def create
		@cart_item = Cart.add_item(session_cart,params) 
		flash[:alert] = @cart_item.errors.full_messages.uniq.to_sentence unless @cart_item.valid? #apabila cart item invalid
	
		redirect_to carts_path
	end


end

#setiap session_cart dipanggil menggunakan method yang di private

# contoh perumpamaan
# @munchen = club.find (1)
# @players = @munchen.players
# @robben = @players.find_by_name("robben")
