class CartItem < ActiveRecord::Base
  attr_accessible :cart_id, :food_id, :quantity, :price
  belongs_to :food
  belongs_to :cart
  validates_presence_of :food
  validate :check_food
  validates_numericality_of :quantity, :only_integer =>true, 
                            :greater_than_or_equal_to =>0, 
                             message: "is invalid please type it again"
  
  before_destroy :add_stock_food

  def check_food
  	if !food.unlimited 
	  	if quantity.to_i <= food.quantity.to_i  
	  	#maksudnya jika jumlah kurang atau sama dengan food quantity dan food stock tidak terbatas
	  	#!!true = true # !true = false
		  	if changes["quantity"]
		  	  old_quantity = changes["quantity"].first.to_i  
		  	  new_quantity = changes["quantity"].last.to_i
		  	  if old_quantity > new_quantity
		  	   	food.quantity = food.quantity + ( old_quantity - new_quantity)
		  	  else
		  	    food.quantity = food.quantity - (new_quantity - old_quantity)
		  	  end
		  	  food.save
		  	end
	  	elsif quantity.to_i > food.quantity.to_i 
	  		self.errors.add(:quantity, "Out of Stock")     
	  	end
	  end
  end
  def add_stock_food
  	food.quantity += quantity #  sama juga food.quantity = food.quantity + quantity
  	food.save
  end
end

#validasi di model ada macam2 salah satunya yaitu :
# before_validate
# arround_validate
# after_validate

# before_create _update _destroy 
# after_create  _update _destroy
# arround_create _update _destroy

# before_save
# arround_save
# after_save

# before_initialize
# arround_initialize
# after_initialize

# kalo mau membuat manual validasi pun bisa yaitu membuat metode

# validates :manual_validasi


# def manual_validasi ( INGAT PRICE  SETELAH IF ITU NAMA KOLUM)
#  if price < 1
#    errors.add (:price , " ga bisa lebih kecil dari nol")
#  end
# end

