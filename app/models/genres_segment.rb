class GenresSegment < ApplicationRecord
  validates_presence_of :segment_id, :genre_id
  belongs_to :genre
  belongs_to :segment
end