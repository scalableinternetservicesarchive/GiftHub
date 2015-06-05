class CreateExchangeQuestions < ActiveRecord::Migration
  def change
    create_table :exchange_questions do |t|
      t.belongs_to :exchange, null: false
      t.belongs_to :question, null: false
    end

    add_index :exchange_questions, :exchange_id
    add_index :exchange_questions, :question_id
  end
end
