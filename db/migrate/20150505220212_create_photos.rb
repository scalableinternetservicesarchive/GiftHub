class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :gallery, null: false
      t.binary :data, null: false
      t.string :caption, null: false
    end

    add_index :photos, :gallery_id
  end
end
