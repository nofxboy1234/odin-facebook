class AddHomePlanetRefToPerson < ActiveRecord::Migration[7.1]
  def change
    # add_reference :people, :home_planet, null: false, foreign_key: true
    add_reference :people, :home_planet, null: false, foreign_key: { to_table: :planets}
  end
end
