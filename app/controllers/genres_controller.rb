class GenresController < ApplicationController

  # GET /genres/:id/segments
  def segments
    @genre = Genre.find(params[:id])
    @segments = @genre.segments

    json_response(@segments)
  end


end
