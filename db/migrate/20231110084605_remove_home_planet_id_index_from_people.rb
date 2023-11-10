class RemoveHomePlanetIdIndexFromPeople < ActiveRecord::Migration[7.1]
  def change
    remove_index :people, :home_planet_id
  end
end
