class CreateExchangeProfiles < ActiveRecord::Migration
  def change
    create_table :exchange_profiles do |t|
      t.belongs_to :user, null: false
      t.belongs_to :exchange, null: false
      t.belongs_to :exchange_profile
      t.binary :delivery_verification
      t.boolean :gift_received, null: false
      t.belongs_to :wish_list
    end
  end
end
