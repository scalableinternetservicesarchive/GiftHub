class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :gallery, null: false
      t.belongs_to :user, null: false
      t.string :value, null: false
    end
  end
end
