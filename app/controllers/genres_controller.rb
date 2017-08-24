class GenresController < ApplicationController

  def index
    @genres = Genre.all
    json_response(@genres)
  end

  # GET /genres/query?genres="horror,adventure"
  def query
    selected_segments = find_genres(params[:genres])
    json_response(selected_segments)
  end

  # GET /genres/:id/segments
  def segments
    @genre = Genre.find(params[:id])
    @segments = @genre.segments
    json_response(@segments)
  end
end
