class Genre < ApplicationRecord
  validates_presence_of :name
  has_many :genres_segments
  has_many :segments, through: :genres_segments
end
