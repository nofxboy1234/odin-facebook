class PersonFilm < ApplicationRecord
  belongs_to :person
  belongs_to :film
end
