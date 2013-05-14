class AddFavouriteToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :favourite, :boolean
  end
end
