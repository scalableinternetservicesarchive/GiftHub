class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :exchangeName
      t.integer :categoryID
      t.string :userEmail
      t.string :notes
      t.string :favorite

      t.timestamps null: false
    end
  end
end
