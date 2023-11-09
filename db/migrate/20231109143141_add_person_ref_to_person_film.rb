class AddPersonRefToPersonFilm < ActiveRecord::Migration[7.1]
  def change
    add_reference :person_films, :person, null: false, foreign_key: true
  end
end
