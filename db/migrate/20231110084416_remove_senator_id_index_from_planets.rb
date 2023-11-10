class RemoveSenatorIdIndexFromPlanets < ActiveRecord::Migration[7.1]
  def change
    remove_index :planets, :senator_id
  end
end
