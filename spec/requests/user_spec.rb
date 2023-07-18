require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index' do
    it 'returns a success response' do
      get '/users/'
      expect(response).to be_successful
    end

    it 'renders the index template of users' do
      get '/users/'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get '/users/'
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe 'GET /users/show' do
    it 'returns a success response' do
      get '/users/45'
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get '/users/45'
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      get '/users/45'
      expect(response.body).to include('Here are the details of a particular user')
    end
  end
end
