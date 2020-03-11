require 'rails_helper'

RSpec.describe Sector, type: :model do
  it { should have_many(:sectors) }
  it { should belong_to(:parent_sector).optional }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
