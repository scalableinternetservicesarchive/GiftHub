class AddColumnsToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :description, :string
    add_column :exchanges, :registration_start, :datetime
    add_column :exchanges, :registration_end, :datetime
    add_column :exchanges, :gift_due_date, :datetime
    add_column :exchanges, :campus_id, :integer, :null => true
    add_column :exchanges, :category_id, :integer, :null => true

    add_index :exchanges, :campus_id
    add_index :exchanges, :category_id
  end
end
