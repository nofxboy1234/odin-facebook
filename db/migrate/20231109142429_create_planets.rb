class CreatePlanets < ActiveRecord::Migration[7.1]
  def change
    create_table :planets do |t|
      # t.references :senator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
