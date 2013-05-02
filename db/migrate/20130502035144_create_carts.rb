class CreateCarts < ActiveRecord::Migration
  def change
    create_table 		:carts do |t|
    	t.string			:session_id
    	t.integer			:ammount
      t.timestamps
    end
  end
end
