class TopupsController < ApplicationController
	before_filter :authenticate_user!

	def index
    @topups = current_user.topups.all
	end

	def new
		@topup = Topup.new
	end

	def create
		@topup = current_user.topups.create(params[:topup])
		#objek pembentuk di form_for adalah :topup
		#membentuk create
		redirect_to topups_path
	end

  def update
		@topup = Topup.find(params[:id])
		@topup.update_attributes(params[:id])
			redirect_to topups_path
	end
	
	def destroy
		@topup = Topup.find(params[:id])
		@topup.destroy
		redirect_to topups_path
	end

	def show
		@topups = current_user.topups.all
		redirect_to topups_path
	end


end
