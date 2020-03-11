require 'rails_helper'

RSpec.describe CountryCreator, type: :class do
  context 'When creating a new country' do
    it 'should increment the count' do
      expect { CountryCreator.create('ILY') }.to change { Country.count }.by 1
    end
  end

  context 'When creating a list of countries' do
    let(:countries) do
      [
        'ABW',
        'AFG',
        'AGO',
        'AIA',
        'ALB'
      ]
    end

    let(:countries_list) do
      {
        'ABW' => 1,
        'AFG' => 2,
        'AGO' => 3,
        'AIA' => 4,
        'ALB' => 5
      }
    end

    it 'should save all results in a hash' do
      expect(CountryCreator.create_list(countries).keys).to eq countries
    end
  end
end
