require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  before {
    @horror = Genre.create(name: "horror")

    @genre_id = @horror.id

    @segment = @horror.segments << Segment.new(name:'Yoda Quote', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8763582' , longitude: '-87.6530538')
  }
  after {@horror.segments = []}

    describe 'GET/genres/:id/segments' do

      before { get "/genres/#{@genre_id}/segments" }

      it 'returns segments associated with a genre' do
        expect(json).not_to be_empty
      end

      it 'returns the status code 200' do
        expect(response).to have_http_status(200)
      end
    end



  end