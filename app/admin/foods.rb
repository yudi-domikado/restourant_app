ActiveAdmin.register Food do
form :partial => "form"
	form do |f|
	  f.inputs do
	    f.input   :name
	    f.input 	:picture
	    f.input   :price
	    f.input   :quantity
	    f.input   :unlimited, :to => :boolean
	  end
	  f.buttons
	end


	index do |c|
    c.column :name
    c.column :picture do |food|
    	image_tag food.picture.url(:thumb)
    end
    c.column :price do |food|
    	number_to_currency(food.price, unit: "Rp.", format: "%u %n")
    end
    c.column :quantity
    c.column :unlimited do |food|
    	food.unlimited ? "Unlimited" : "Limited"
    end
    actions
  end

end
