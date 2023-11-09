class Person < ApplicationRecord
  belongs_to :species
  belongs_to :home_planet
end
