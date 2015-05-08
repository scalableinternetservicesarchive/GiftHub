class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :exchange, null: false
      t.string :title, null: false
      t.belongs_to :input_type, null: false
    end
  end
end
