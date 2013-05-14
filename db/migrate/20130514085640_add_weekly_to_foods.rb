class AddWeeklyToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :weekly, :boolean
  end
end
