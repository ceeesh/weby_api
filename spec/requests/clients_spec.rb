require 'rails_helper'

RSpec.describe '/Client', type: :request do
    let(:client) { FactoryBot.create(:client) }

    describe "POST /signup with valid params" do
      it "creates a new user" do
        post "/api/v1/signup", params: { first_name: client.first_name, last_name: client.last_name, 
          email: Faker::Internet.email, password: '123', password_confirmation: '123',
          birthday: '1997-08-26', gender: 'Others', 
          country: 'PH', phone_number: '123-45-678' }
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /signin with valid params" do
      it "can signin" do
        post "/api/v1/signin", params: { email: client.email, password: '123' }
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /signin with invalid params" do
      it "cannot signin" do
        post "/api/v1/signin", params: { email: 'notemail.com', password: client.password }
        expect(response).to have_http_status(400)
      end
    end

    describe "POST /projects with valid params" do
      it "creates a new project" do
        post "/api/v1/projects", params: { name: 'Spotify Clone', description: '123', 
          status: false, start_date: '2014-07-02', end_date: '2014-07-02', 
          duration: '6 months', priority: 'low', price: '5'}, headers: { Authorization: client.token }
        expect(response).to have_http_status(200)
      end
    end

    describe 'Get all projects' do
      it 'returns all the project' do
        get '/api/v1/projects', headers: { Authorization: client.token }
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET all the bookings' do
    it 'returns all the bookings' do
      get '/api/v1/bookings', headers: { Authorization: client.token }
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH user data' do
    it 'updates user data' do
      patch '/api/v1/client/2', params: { first_name: client.first_name, last_name: client.last_name, 
        birthday: client.birthday, gender: client.gender, phone_number: client.phone_number, 
        country: client.country, profile_picture_url: client.profile_picture_url }, headers: { Authorization: client.token }
      expect(response).to have_http_status(200)
    end
  end

end