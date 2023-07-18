require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /posts#index' do
    it 'returns a success response' do
      get '/users/45/posts'
      expect(response).to be_successful
    end

    it 'renders the index template of users post' do
      get '/users/45/posts'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get '/users/45/posts'
      expect(response.body).to include('Here is a list of all the post for a particular user')
    end
  end

  describe 'GET posts#show' do
    it 'returns a successful response' do
      get '/users/45/posts/45'
      expect(response).to have_http_status(200)
    end

    it 'renders the post template' do
      get '/users/45/posts/45'
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      get '/users/45/posts/45'
      expect(response.body).to include('Here is a particular post by a specific user')
    end
  end
end
