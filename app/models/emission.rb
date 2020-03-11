class Emission < ApplicationRecord
  belongs_to :country
  belongs_to :sector

  validates_presence_of :country, :sector

  def amount_for_year(year)
    data.find { |v| v['year'] == year.to_s }['amount'].to_f
  end
end
