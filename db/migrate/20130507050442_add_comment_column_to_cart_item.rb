class AddCommentColumnToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :comment, :string
  end
end
