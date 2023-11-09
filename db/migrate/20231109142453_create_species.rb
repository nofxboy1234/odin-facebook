class CreateSpecies < ActiveRecord::Migration[7.1]
  def change
    create_table :species do |t|

      t.timestamps
    end
  end
end
