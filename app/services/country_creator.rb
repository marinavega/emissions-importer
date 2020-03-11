class CountryCreator
  def self.create(code)
    country = Country.find_or_initialize_by(code: code)
    country.save!
    country
  end

  def self.create_list(list)
    countries = {}
    list.each do |code|
      country = create(code)
      countries[code] = country.id
    end
    countries
  end
end
