class AddAncestryToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :ancestry, :string
    add_index :foods, :ancestry
    end
end
