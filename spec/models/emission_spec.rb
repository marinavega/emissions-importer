require 'rails_helper'

RSpec.describe Emission, type: :model do
  it { should belong_to(:country) }
  it { should belong_to(:sector) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:sector) }
end
