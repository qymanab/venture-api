class Genre < ApplicationRecord
  validates_presence_of :type
  has_many :genres_segments
  has_many :segments, through: :genres_segments
end