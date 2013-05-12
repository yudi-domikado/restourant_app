class TopupsController < ApplicationController
	before_filter :authenticate_user!
	def index
    @topups = current_user.topups.all
	end

	def new
		if current_user?
			@topup = Topup.new
		else
			flash[:alert] = "Wrong user"
		end
	end

	def create
		@topup = Topup.create(params[:topup])
		#objek pembentuk di form_for adalah :topup
		#membentuk create
		redirect_to #topups_path
	end

  def update
		@topup = Topup.find(params[:id])
		@topup.update_attributes(params[:id])
		flash[:alert] = @cart_item.errors.full_messages.uniq.to_sentence unless @order_item.valid? #apabila cart item invalid
		#menunjukan message alert dari model full sentence jika cart time tidak valid alias tidak melewati
		redirect_to carts_path
	end
	
	def destroy
		@topup = Topup.find(params[:id])
		@topup.destroy
		redirect_to #topups_path
	end

	def show
		redirect_to #topups_path
	end
end
