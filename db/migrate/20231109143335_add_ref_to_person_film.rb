class AddRefToPersonFilm < ActiveRecord::Migration[7.1]
  def change
    add_reference :person_films, :film, null: false, foreign_key: true
  end
end
