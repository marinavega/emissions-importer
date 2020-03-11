require 'csv'

namespace :emissions do
  desc 'Import CO2 emissions from a CSV file'
  task import: :environment do
    csv = CSV.read('storage/emissions.csv', headers: true)
    countries = CountryCreator.create_list(csv['Country'].uniq)
    sectors = SectorCreator.create_list(csv['Sector'].uniq)

    CSV.foreach('storage/emissions.csv', headers: true) do |row|
      SectorCreator.parent_sector(row)
      parsed_data = EmissionCreator.parse_data(countries[row['Country']],
                                               sectors[row['Sector']],
                                               row)

      EmissionCreator.create(parsed_data)
    end
  end
end
