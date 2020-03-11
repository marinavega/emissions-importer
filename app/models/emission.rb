class Emission < ApplicationRecord
  belongs_to :country
  belongs_to :sector

  validates_presence_of :country, :sector
  validates_uniqueness_of [:country, :sector]
end
