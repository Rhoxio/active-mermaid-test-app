class Galaxy < ApplicationRecord
  has_many :stars
  belongs_to :cluster, optional: true
end