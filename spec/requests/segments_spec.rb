require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  let!(:segment) {create_list :segment, 10}

  describe 'GET /segments' do
    before {get '/segments'}

    it 'returns segments' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end
