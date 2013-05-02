class CreateOrders < ActiveRecord::Migration
  def change
    create_table 		:orders do |t|
    	t.integer			:user_id
    	t.integer			:ammount
      t.timestamps
    end
  end
end
