class CreateWishListItems < ActiveRecord::Migration
  def change
    create_table :wish_list_items do |t|
      t.belongs_to :wish_list, null: false
      t.string :name, null: false
    end
  end
end
