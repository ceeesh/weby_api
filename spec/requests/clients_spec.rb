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

    describe "POST /signup with invalid params" do
      it "creates a new user" do
        post "/api/v1/signup", params: { first_name: nil, last_name: nil, 
          email: nil, password: nil, password_confirmation: nil,
          birthday: nil, gender: nil, 
          country: nil, phone_number: nil }
        expect(response).not_to have_http_status(200)
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
        expect(response).not_to have_http_status(200)
      end
    end

  describe 'PATCH /client/:id with valid params' do
    it 'updates client data' do
      patch '/api/v1/client/2', params: { first_name: client.first_name, last_name: client.last_name, 
        birthday: client.birthday, gender: client.gender, phone_number: client.phone_number, 
        country: client.country, profile_picture_url: client.profile_picture_url }, headers: { Authorization: client.token }
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /client/:id with invalid params' do
    it 'doesnt update client data with invalid info' do
      patch '/api/v1/client/2', params: { first_name: nil, last_name: nil, 
        birthday: nil, gender: nil, phone_number: nil, 
        country: nil, profile_picture_url: nil }, headers: { Authorization: client.token }
      expect(response).not_to have_http_status(200)
    end
  end

  describe 'PATCH /client/:id with invalid token' do
    it 'doesnt update client data' do
      patch '/api/v1/client/2', params: { first_name: client.first_name, last_name: client.last_name, 
        birthday: client.birthday, gender: client.gender, phone_number: client.phone_number, 
        country: client.country, profile_picture_url: client.profile_picture_url }, headers: { Authorization: 'token'}
      expect(response).not_to have_http_status(200)
    end
  end

end