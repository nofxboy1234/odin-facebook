class RemoveSenatorForeignKeyFromPlanets < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key 'planets', 'people', column: 'senator_id'
  end
end
