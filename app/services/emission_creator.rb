class EmissionCreator
  def self.create(parsed_data)
    Emission.where(country_id: parsed_data[:country_id],
                   sector_id: parsed_data[:sector_id])
            .first_or_create(parsed_data)
            .update(parsed_data)
  end

  def self.parse_data(country, sector, values)
    {
      country_id: country,
      sector_id: sector,
      data: emission_data(values)
    }
  end

  def self.emission_data(values)
    values.reject { |key, _value| ['Country', 'Sector', 'Parent sector'].include?(key) }
          .map { |year, amount| { year: year, amount: amount } }
  end
end
