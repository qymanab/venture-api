module GenreHelper

  def assign_genres(segment, genre_response)
    p "*"*50
    p genre_response
    p "*"*50
    if genre_response != ""
      genre_array = parse_genres(genre_response)
      add_genres(segment, genre_array)
    else
      add_genres(segment, ['other'])
    end
  end

  def add_genres(segment, genre_array)
    genre_array.each do |genre|
      genre_object = Genre.find_by(name: genre)
      segment.genres_segments << GenresSegment.new(genre: genre_object)
    end
  end

  def parse_genres(genre_response)
    JSON.parse(genre_response)
  end

end
