class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.belongs_to :exchange, null: false
      t.belongs_to :user, null: false
      t.string :title, null: false
      t.datetime :upload_date, null: false
    end

    add_index :galleries, :exchange_id
    add_index :galleries, :user_id
  end
end
