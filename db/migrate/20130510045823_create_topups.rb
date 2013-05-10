class CreateTopups < ActiveRecord::Migration
  def change
    create_table :topups do |t|
      t.integer :credit
      t.date    :topup_date
      t.integer :user_id

      t.timestamps
    end
  end
end
