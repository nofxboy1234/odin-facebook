class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      # t.references :species, null: false, foreign_key: true
      # t.references :home_planet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
