class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string 	 :name
      t.integer  :price
      t.integer  :quantity
      t.boolean  :unlimited, :default => false
      t.timestamps
    end
  end
end
