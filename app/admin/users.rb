ActiveAdmin.register User do

	form do |f|
	  f.inputs do
	  	f.input :name
	    f.input :email
	    f.input :balance
	    f.input :password
	    f.input :password_confirmation    
	  end
	  f.buttons
	end

	index do |c|
    c.column :name
    c.column :email
    c.column :balance
    actions
  end
end

	# mengubah apa aja yang berhubungan dengan active admin disini