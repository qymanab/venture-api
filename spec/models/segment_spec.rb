require 'rails_helper'

RSpec.describe Segment, type: :model do
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:body) }
  it { should have_many(:genres)          }
  it { should have_many(:genres_segments) }

  describe 'segment methods' do
      let(:segment) {Segment.create(name:'Chair' , body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.876116499999995' , longitude: '-87.6530416' )}
      let(:user_position) {[segment.latitude.to_f, segment.longitude.to_f]}
    describe 'coords' do

      it "converts a segment's latitude and longitude to an array of floats" do
        expect(segment.coords).to eq([41.876116499999995, -87.6530416])
      end
    end

    describe 'in_range?' do

      it "returns if a user is within 10 m of a segment" do
        expect(segment.in_range?(user_position, 10)).to eq(true)
      end
    end

    describe 'display_nearby' do

      it "returns a collection of nearby segments" do
        expect(Segment.display_nearby(user_position)).not_to be_empty
      end
    end

    describe 'check_range' do

      it "returns a collection of nearby segments" do
        expect(segment.check_range(user_position)).to eq(segment)
      end
    end



  end
end
