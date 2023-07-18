require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index' do
    it 'returns a success response' do
      get '/users/'
      expect(response).to be_successful
    end

    it 'renders the index template of views/users' do
      get '/users/'
      expect(response).to render_template(:index)
    end
  end
  it 'includes the correct placeholder text' do
    get '/users/'
    expect(response.body).to include('Here is a list of all users')
  end


end
