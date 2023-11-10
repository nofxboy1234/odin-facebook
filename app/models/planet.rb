class Planet < ApplicationRecord
  belongs_to :senator, class_name: 'Person'
  has_many :citizens, class_name: 'Person', foreign_key: :home_planet_id
end
