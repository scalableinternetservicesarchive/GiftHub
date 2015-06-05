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

    add_index :exchange_profiles, :user_id
    add_index :exchange_profiles, :exchange_id
    add_index :exchange_profiles, :exchange_profile_id
    add_index :exchange_profiles, :wish_list_id
  end
end
