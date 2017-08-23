module SegmentHelper
  def attach_genres(segment_array)
    segment_array.map { |segment|
        {
          name: segment.name,
          body: segment.body,
          latitude: segment.latitude,
          longitude: segment.longitude,
          author_id: segment.author_id,
          genre: segment.genres.first.name
        }
      }
  end
end