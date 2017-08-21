require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  let!(:segments) {create_list :segment, 10}
  let(:segment_id) { segments.first.id }



  describe 'GET /segments' do
    before {get '/segments?latitude=41.876116499999995&longitude=-87.6530416
'}

    it 'returns segments' do

      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /segments/:id' do
    before { get "/segments/#{segment_id}?latitude=41.876116499999995&longitude=-87.6530416" }

    context 'when the record exists' do
      it 'returns the segment' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(segment_id)
      end

      it 'returns the status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:segment_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Segment/)
      end
    end
  end

  describe 'GET /segments/nearby' do
    let(:valid_attributes) { { latitude: '41.876116499999995', longitude: '-87.6530416' } }
    let(:invalid_attributes) { { latitude: '16', longitude: '-16' } }

    context 'when the request is within range' do
      before { get '/segments/nearby', params: valid_attributes }
      it 'shows the nearby segments' do
        expect(json.size).to eq(10)
      end
    end

    context 'when the request parmas are invalid' do
      before { get '/segments/nearby'}
      it 'does not return any segments' do
        expect(json.size).to eq(0)
      end
    end

    context 'when the request parmas are out of range' do
      before { get '/segments/nearby', params: invalid_attributes}
      it 'does not return any segments' do
        expect(json.size).to eq(0)
      end
    end


  end

  describe 'POST /segments' do
    let(:valid_attributes) { { name: 'fake story', body: 'fake body', latitude: '1', longitude: '2', genre: "" } }

    context 'when the request is valid' do
      before { post '/segments', params: valid_attributes }

      it 'creates a segment' do
        expect(json['name']).to eq('fake story')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/segments', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Body can't be blank/)
      end
    end

    context "when it has a genre" do
      let(:attributes_with_genre) { { name: 'fake story', body: 'fake body', latitude: '1', longitude: '2', genre: "['horror']" } }
      before { post '/segments', params: valid_attributes }

      it " creates segment with defined genres" do
        # expect{ post '/segments', params: attributes_with_genre }.to change{GenresSegment.count}.by(1)
        expect(response).to have_http_status(201)
      end

    end
  end

  # Test suite for PUT /segments/:id
  describe 'PUT /segments/:id' do
    let(:valid_attributes) { { name: 'updated story' } }

    context 'when the record exists' do
      before { put "/segments/#{segment_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /segments/:id
  describe 'DELETE /segments/:id' do
    before { delete "/segments/#{segment_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
