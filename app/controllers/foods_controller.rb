class FoodsController < ApplicationController

	def index
		@foods = Food.all
	end

	# def create
 #  @foods = Food.create( params[:id] )
 #  end

	def show
		redirec_to foods_path
	end


end
