class FoodsController < ApplicationController

	def index
		@foods = Food.search(params[:search])
	end
	# def create
 #  @foods = Food.create( params[:id] )
 #  end

	def show
		redirect_to foods_path
	end

	def search

	end
end
