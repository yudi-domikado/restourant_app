class HomeController < ApplicationController

	def index
		@slides = Food.where(:favourite => true)	
		@whatshot = Food.where(:favourite => false)
	end

	def show
	
	end

end
