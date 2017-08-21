class SegmentsController < ApplicationController
  before_action :set_segment, only: [:show, :update, :destroy]

  # GET /segment
  def index
    @segment = Segment.all
    json_response(@segment)
  end

  # POST /segments
  def create
    @segment = Segment.create!(segment_params)

    p params[:genre]
    assign_genres(@segment, params[:genre])
    p "*"*50
    p @segment.genres
    p "*"*50
    json_response(@segment, :created)
  end

  def nearby
    coordinates = [params[:latitude], params[:longitude]]
    @segment = Segment.display_nearby(coordinates)
    json_response(@segment)
  end

  # GET /segments/:id
  def show
    coordinates = [params[:latitude], params[:longitude]]
    @segment = @segment.check_range(coordinates)
    json_response(@segment)

  end

  # PUT /segments/:id
  def update
    @segment.update(segment_params)
    head :no_content
  end

  # DELETE /segments/:id
  def destroy
    @segment.destroy
    head :no_content
  end




  private
  def segment_params
    # whitelist params
    params.permit(:name, :body, :latitude, :longitude)
  end
  #
  # def genre_params
  #   # whitelist params
  #   params.permit(:genre)
  # end

  def set_segment
    @segment = Segment.find(params[:id])
  end
end
