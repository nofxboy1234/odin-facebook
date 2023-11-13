class RemoveHomePlanetForeignKeyFromPeople < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key 'people', 'planets', column: 'home_planet_id'
  end
end
