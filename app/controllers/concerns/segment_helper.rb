module SegmentHelper
  def attach_genres(segment)
    if segment.class == Segment && segment.id
      {
        name: segment.name,
        body: segment.body,
        latitude: segment.latitude,
        longitude: segment.longitude,
        author_id: segment.author_id,
        genre_id: segment.genres.first.id || nil,
        genre: segment.genres.first.name || nil
      }
    elsif segment.class == Segment
      {
        name: segment.name,
        body: segment.body,
        latitude: segment.latitude,
        longitude: segment.longitude,
        author_id: segment.author_id
      }
    elsif segment.empty?
      return []
    else
      segment.map { |object|
        {
          id: object.id,
          name: object.name,
          body: object.body,
          latitude: object.latitude,
          longitude: object.longitude,
          author_id: object.author_id,
          genre_id: object.genres.first.id,
          genre: object.genres.first.name
        }
      }
    end

  end
end
