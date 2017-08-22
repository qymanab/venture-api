require 'rails_helper'

RSpec.describe 'Todos API', type: :requests do

    # describe 'GET/genres' do
    # end

    # describe 'GET/genres/:id' do
    # end

    describe 'GET/genres/:id/segments' do
      before { get "genres/#{genre_id}/segments" }

      xit 'returns segments associated with a genre' do
      end

      xit 'returns the status code 200' do
      end
    end



  end