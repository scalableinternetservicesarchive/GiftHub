class CreateWishLists < ActiveRecord::Migration
  def change
    create_table :wish_lists do |t|
      t.string :title, null: false
      t.datetime :last_updated, null: false
    end
  end
end
