class Person < ApplicationRecord
  belongs_to :species
  belongs_to :home_planet, class_name: 'Planet'

  has_many :person_films
  has_many :films, through: :person_films
  
  has_one :senator, through: :home_planet
  has_many :citizens, through: :home_planet
end
