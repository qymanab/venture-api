require 'rails_helper'

RSpec.describe Genre, type: :model do
  it { should validate_presence_of(:type) }
  it { should have_many(:segments)        }
  it { should have_many(:genres_segments) }
end