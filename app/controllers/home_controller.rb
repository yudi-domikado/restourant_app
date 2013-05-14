class HomeController < ApplicationController

	def index
		@slides = Food.where(:favourite => true)	
		@whatshot = Food.where(:favourite => false)
		@weekly = Food.where(:weekly => true)
	end

	def show
	
	end

end
