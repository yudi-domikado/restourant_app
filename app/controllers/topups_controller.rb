class TopupsController < ApplicationController
	before_filter :authenticate_user!
	def new
		if current_user?
		@topup = Topup.new
		else
		flash[:alert] = "Wrong user"
		end
	end

	def create
		@topup = Topup.new(params[:id])
		@topup.save
		redirect_to #topups_path
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
