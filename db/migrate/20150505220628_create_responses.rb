class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :exchange_question, null: false
      t.belongs_to :user, null: false
    end

    add_index :responses, :exchange_question_id
    add_index :responses, :user_id
  end
end
