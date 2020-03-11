require 'csv'

namespace :emissions do
  desc 'Import CO2 emissions from a CSV file'
  task import: :environment do
    csv = CSV.read('storage/emissions.csv', headers: true)
    countries = CountryCreator.create_list(csv['Country'].uniq)
    sectors = SectorCreator.create_list(csv['Sector'].uniq)

    CSV.foreach('emissions.csv', headers: true) do |row|
      SectorCreator.parent_sector(row)
      EmissionCreator.create(countries[row['Country']],
                             sectors[row['Sector']],
                             row)
    end
  end
end
