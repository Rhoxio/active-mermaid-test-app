class System < ApplicationRecord
  has_many :planets
  belongs_to :star
end