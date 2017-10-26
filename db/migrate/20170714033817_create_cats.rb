class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.integer :user_id
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, limit: 1, null: false
      t.text :description

      t.timestamps
    end
    add_index :cats, :user_id
  end
end
