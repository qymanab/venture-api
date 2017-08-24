module GenreHelper

  def assign_genres(segment, genre_response)
    if genre_response != ""
      # genre_array = parse_genres(genre_response)
      add_genres(segment, genre_response)
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

  def find_genres(genre_response)
    if genre_response
      get_selected_genres_segments(genre_response)
    else
      Segment.all
    end
  end

  def get_selected_genres_segments(genre_response)
    found_genres = []
    genre_array = parse_genres(genre_response)
    genre_array.each do |genre|
      if Genre.find_by(name: genre)
        found_genres += Genre.find_by(name: genre).segments
      end
    end
    found_genres
  end

  def parse_genres(genre_response)
    JSON.parse(genre_response).split(",")
  end

end
