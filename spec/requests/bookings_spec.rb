RSpec.describe '/Booking', type: :request do
  let(:client) { FactoryBot.create(:client) }

  describe 'GET /bookings with valid token' do
    it 'returns all the bookings' do
      get '/api/v1/bookings', headers: { Authorization: client.token }
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'GET /bookings with invalid token' do
    it 'returns all the bookings' do
      get '/api/v1/bookings', headers: { Authorization: 'hello' }
      expect(response).not_to have_http_status(200)
    end
  end

end