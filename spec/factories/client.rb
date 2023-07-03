FactoryBot.define do
  factory :client do
      email { Faker::Internet.email }
      first_name { Faker::Name.unique.name }
      last_name { Faker::Name.unique.name } 
      token { Faker::Alphanumeric.alpha(number: 50) }
      id { '99' }
      password { BCrypt::Password.create('123') }
      # password_confirmation { '123' }
      admin { false }
      verified { false }
      birthday { '1997-08-26' }
      gender { 'Others' }
      country { 'PH' }
      phone_number { '123-45-678' }
  end
end