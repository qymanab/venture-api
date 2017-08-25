class SegmentsController < ApplicationController
  before_action :set_segment, only: [:show, :update, :destroy]

  # GET /segment
  def index
    @segment = Segment.order(created_at: :desc)
    @segments = attach_genres(@segment)
    json_response(@segments)
  end

  # POST /segments
  def create
    @segment = Segment.create!(segment_params)

    assign_genres(@segment, params[:genre])
    json_response(@segment, :created)
  end

  def nearby
    coordinates = [params[:latitude], params[:longitude]]
    @segment = Segment.display_nearby(coordinates)
    @segments = attach_genres(@segment)
    json_response(@segments)
  end

  # GET /segments/:id
  def show
    coordinates = [params[:latitude], params[:longitude]]
    @segment = @segment.check_range(coordinates)
    json_response(attach_genres(@segment))
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
