ActiveAdmin.register Food do
form :partial => "form"
	form do |f|
	  f.inputs do
	    f.input   :name
	    f.input   :picture
	    f.input   :price
	    f.input   :quantity
	    f.input   :unlimited, :to => :boolean
      f.input   :favourite, :to => :boolean
      f.input   :weekly, :to => :boolean
      f.input   :info                    #, :input_html => { :height => "200"}
      f.input   :category, :collection => Category.all.map{|u| [u.category, u.id]}
      f.input   :tag_list
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
    c.column :category do |cat|
      cat.category.category # seharusnya namanya name biar ga bingung
     end
    c.column :favourite do |food|
      food.favourite ? "Recommended" : "Not Recommended" 
    # sama aja dengan
    #if food.favourite ?
    #   "Recommended"
    #else
    #   "Not Recommended"
    #end
    end
    c.column :weekly do |weekly|
      weekly.weekly ? "Yes" : "No"
    end
    c.column :info 
    c.column :tag_list 
      actions
    end

end
