class AddRefToPlanet < ActiveRecord::Migration[7.1]
  def change
    add_reference :planets, :senator, null: false, foreign_key: { to_table: :people }
  end
end
