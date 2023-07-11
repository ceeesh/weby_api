RSpec.describe '/Project', type: :request do
  let(:client) { FactoryBot.create(:client) }

  describe "POST /projects with valid params" do
    it "creates a new project" do
      post "/api/v1/projects", params: { name: 'Spotify Clone', description: '123', 
        status: false, start_date: '2014-07-02', end_date: '2014-07-02', 
        duration: '6 months', priority: 'low', price: '5'}, headers: { Authorization: client.token }
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /projects with invalid token" do
    it "creates a new project" do
      post "/api/v1/projects", params: { name: 'Spotify Clone', description: '123', 
        status: false, start_date: '2014-07-02', end_date: '2014-07-02', 
        duration: '6 months', priority: 'low', price: '5'}, headers: { Authorization: 'token' }
      expect(response).not_to have_http_status(200)
    end
  end

  describe "POST /projects with invalid params" do
    it "creates a new project" do
      post "/api/v1/projects", params: { name: nil, description: nil, 
        status: nil, start_date: nil, end_date: nil, 
        duration: nil, priority: nil, price: nil }, headers: { Authorization: client.token }
      expect(response).not_to have_http_status(200)
    end
  end

  describe 'GET /projects valid token' do
    it 'returns all the project' do
      get '/api/v1/projects', headers: { Authorization: client.token }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /projects invalid token' do
    it 'returns all the project' do
      get '/api/v1/projects', headers: { Authorization: 'token' }
      expect(response).not_to have_http_status(200)
    end
  end
end