module SegmentHelper
  def attach_genres(segment)
    if segment.class == Segment
      {
        name: segment.name,
        body: segment.body,
        latitude: segment.latitude,
        longitude: segment.longitude,
        author_id: segment.author_id,
        genre_id: segment.genres.first.id,
        genre: segment.genres.first.name
      }

    elsif segment.empty?
      return []
    else
      segment.map { |segment|
        {
          id: segment.id,
          name: segment.name,
          body: segment.body,
          latitude: segment.latitude,
          longitude: segment.longitude,
          author_id: segment.author_id,
          genre_id: segment.genres.first.id,
          genre: segment.genres.first.name
        }
      }
    end

  end
end