class FoodsController < ApplicationController

	def index
		@foods = Kaminari.paginate_array(Food.search(params[:search])).page(params[:page]).per(2)
		flash[:alert] = "Search not found" if @foods.blank? # nunjukin data ada apa nggak ada hanya pake .blank atau .present dengan tanda tanya
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
