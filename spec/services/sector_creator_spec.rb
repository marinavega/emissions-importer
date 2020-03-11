require 'rails_helper'

RSpec.describe SectorCreator, type: :class do
  context 'When creating a new sector' do
    it 'should increment the count' do
      expect { SectorCreator.create('A Fake Sector') }.to change { Sector.count }.by 1
    end
  end

  context 'When creating a list of sectors' do
    let(:sectors) do
      [
        'Total including LULUCF',
        'Fuel Combustion Activities',
        'Fugitive Emissions from Solid Fuels',
        'Fugitive Emissions from Oil and Gas',
        'Energy'
      ]
    end

    let(:sectors_list) do
      {
        'Total including LULUCF' => 1,
        'Fuel Combustion Activities' => 2,
        'Fugitive Emissions from Solid Fuels' => 3,
        'Fugitive Emissions from Oil and Gas' => 4,
        'Energy' => 5
      }
    end

    it 'should save all results in a hash' do
      expect(SectorCreator.create_list(sectors).keys).to eq sectors
    end
  end
end
