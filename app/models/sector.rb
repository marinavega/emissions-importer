class Sector < ApplicationRecord
  has_many :emissions
  has_many :sectors, class_name: 'Sector',
                     foreign_key: 'parent_sector_id'

  belongs_to :parent_sector, class_name: 'Sector', optional: true

  validates_presence_of :name
  validates_uniqueness_of :name
end
