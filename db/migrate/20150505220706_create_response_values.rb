class CreateResponseValues < ActiveRecord::Migration
  def change
    create_table :response_values do |t|
      t.belongs_to :response, null: false
      t.string :value, null: false
    end

    add_index :response_values, :response_id
  end
end
