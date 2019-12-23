class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :number, null: false
      t.string :age, null: false
      t.string :img, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
