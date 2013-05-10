ActiveAdmin.register Order do
	index do |o|
	  o.column :id
    o.column :ammount
    
    o.column :name do |us|
  	  us.user.name
    end

  	o.column :id do |us|
  	  us.user.id
    end
    
    o.column :comment

    o.column :picture do |order|
      image_tag order.order_items.first.food.picture.url(:thumb) 
    end
    # end
    # o.column :quantity do |quantity|
    # order_item.quantity
    # end

  end
end
