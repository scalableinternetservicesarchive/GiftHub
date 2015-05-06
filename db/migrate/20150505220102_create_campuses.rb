class CreateCampuses < ActiveRecord::Migration
  def change
    create_table :campuses do |t|
      t.string :name, null: false
      t.string :email_domain, null: false
    end
  end
end
