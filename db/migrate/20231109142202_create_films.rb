class CreateFilms < ActiveRecord::Migration[7.1]
  def change
    create_table :films do |t|

      t.timestamps
    end
  end
end
