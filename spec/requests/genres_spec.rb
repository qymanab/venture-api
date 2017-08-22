require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  before {
    @horror = Genre.create(name: "horror")
    @comedy = Genre.create(name: "comedy")
    @romance = Genre.create(name: "romance")

    @genre_id = @horror.id

    @segment = @horror.segments << Segment.new(name:'Yoda Quote', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8763582' , longitude: '-87.6530538')

    @segment2 = @comedy.segments << Segment.new(name:'Luke Quote', body: Faker::Lorem.paragraphs(rand(1..5), true), latitude: '41.8763582' , longitude: '-87.6530538')

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

    describe 'GET /genres' do

      before { get '/genres' }

      it 'returns all genres' do

        expect(json.size).to eq(3)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /genres/query' do
      context 'when a valid query string is passed' do

        before { get '/genres/query?genres=["horror"]'}

        it 'returns segments with horror genre' do
          expect(json.size).to eq(1)
        end
      end

      context 'when no query string is passed' do

        before { get '/genres/query'}

        it 'returns all segments' do
          expect(json.size).to eq(2)
        end
      end

      context 'when an invalid string is passed' do

        before { get '/genres/query?genres=["fake"]'}

        it 'returns all segments' do
          expect(json.size).to eq(0)
        end
      end
    end
  end
