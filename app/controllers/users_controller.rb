class UsersController < ApplicationController
before_filter :authenticate_user! # harus login
	def index

	end

	def check_out
		@cart = Cart.find_or_create_by_session_id(session_cart)	
	end

end
