class Cluster < ApplicationRecord
  has_many :galaxies
  has_many :planets
  has_many :stars
end