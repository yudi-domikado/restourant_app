class RemoveCollumnCommentFromCart < ActiveRecord::Migration
  def up
    remove_column :cart_items, :comment
  end

  def down
    add_column :cart_items, :comment, :string
  end
end
