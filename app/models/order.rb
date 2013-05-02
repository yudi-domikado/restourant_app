class Order < ActiveRecord::Base
  attr_accessible :user_id, :ammount
  belongs_to :user
  has_many :order_items, dependent: :destroy

  def self.approve_cart(session_id, user_id)
  	#check apakah cart dengan session_id yang diberikan ada atau tidak
  	cart = Cart.find_by_session_id(session_id)
  	return unless cart # kalo gak ada, kembalikan dengan hasil yang kosong
  	#klo ada maka buat order baru
  	order = new
  	order.user_id = user_id #daftarkan siapa pemilik order
  	order.ammount = 0 #buat total awal adalah 0
  	# looping cart item untuk menjumlahkan total yang akan dibayar
  	# dan pindahkan cart item ke order item
  	cart.cart_items.each do |cart_item|
  		order.ammount += (cart_item.price * cart_item.quantity) # subtotal tiap cart item
  		order.order_items.new({food_id: cart_item.food_id, quantity: cart_item.quantity, price: cart_item.price})
  	end

  	order.save
  	cart.destroy
    return order
  end
end
