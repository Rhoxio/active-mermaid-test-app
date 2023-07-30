class Planet < ApplicationRecord
  belongs_to :system
  belongs_to :cluster, optional: true
end