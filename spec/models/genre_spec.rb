require 'rails_helper'

RSpec.describe Genre, name: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:segments)        }
  it { should have_many(:genres_segments) }
end
