class CreatePeoplePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people_people do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :last_name

      t.timestamps
    end
  end
end
