class UpdatePlanetSenatorNullConstraint < ActiveRecord::Migration[7.1]
  def change
    change_column_null :planets, :senator_id, true
  end
end
