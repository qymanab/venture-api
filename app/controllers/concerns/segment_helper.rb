module SegmentHelper
  def attach_genres(segment)
    # p segment
    if segment.class == Segment
      # p "singular"
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
      # p 'empty'
      return []
    else
      segment.map { |segment|
        # p 'multiple'
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
end