class SegmentsController < ApplicationController
  before_action :set_segment, only: [:show, :update, :destroy]

  # GET /segment
  def index
    coordinates = [params[:latitude].to_f, params[:longitude].to_f]
    @segment = Segment.display_nearby(coordinates)
    json_response(@segment)
  end

  # POST /segments
  def create
    @segment = Segment.create!(segment_params)
    json_response(@segment, :created)
  end

  # GET /segments/:id
  def show
    p @segment
    coordinates = [params[:latitude].to_f, params[:longitude].to_f]
    p @segment = @segment.check_range(coordinates)
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

  def set_segment
    @segment = Segment.find(params[:id])
  end
end
