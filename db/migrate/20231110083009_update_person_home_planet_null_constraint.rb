class UpdatePersonHomePlanetNullConstraint < ActiveRecord::Migration[7.1]
  def change
    change_column_null :people, :home_planet_id, true
  end
end
