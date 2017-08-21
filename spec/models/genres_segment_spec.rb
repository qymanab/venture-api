require 'rails_helper'

RSpec.describe GenresSegment, type: :model do
  it { should validate_presence_of(:genre_id)   }
  it { should validate_presence_of(:segment_id) }
  it { should belong_to(:segment)               }
  it { should belong_to(:genre)                 }
end
