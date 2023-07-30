class Star < ApplicationRecord
  has_one :system
  belongs_to :galaxy, optional: true
  belongs_to :cluster, optional: true
end