class AddSpeciesRefToPerson < ActiveRecord::Migration[7.1]
  def change
    add_reference :people, :species, null: false, foreign_key: true
  end
end
