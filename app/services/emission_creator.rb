class EmissionCreator
  def self.create(country, sector, row)
    Emission.where(country_id: country,
                   sector_id: sector)
            .first_or_create(parse_data(country, sector, row))
            .update(parse_data(country, sector, row))
  end

  def self.parse_data(country, sector, row)
    {
      country_id: country,
      sector_id: sector,
      data: emission_data(row)
    }
  end

  def self.emission_data(values)
    values.reject { |key, _value| ['Country', 'Sector', 'Parent sector'].include?(key) }
          .map { |year, amount| { year: year, amount: amount } }
  end
end
