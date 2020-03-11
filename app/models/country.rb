class Country < ApplicationRecord
  has_many :emissions

  validates_presence_of :code
  validates_uniqueness_of :code
end
