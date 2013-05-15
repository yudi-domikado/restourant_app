class FoodsController < ApplicationController

	def index
		@foods = Kaminari.paginate_array(Food.search(params[:search])).page(params[:page]).per(3) 
		# @foods = Kaminari.paginate_array(Category.foods.search(params[:search])).page(params[:page]).per(3)
		flash[:alert] = "Search not found" if @foods.blank? # nunjukin data ada apa nggak ada hanya pake .blank atau .present dengan tanda tanya
		if params[:tag]
		@foods = Food.tagged_with(params[:tag]).page(params[:page]).per(3)
		end
	end

	# def tag_cloud
	#  	@tags = Food.tag_counts(:limit => 5, :order => "count desc")
	#  end

	def show
		redirect_to foods_path
	end

	def search

	end



end
