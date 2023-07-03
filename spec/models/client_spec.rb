require 'rails_helper'

RSpec.describe Client, type: :model do

  it "should have many projects" do
    t = Client.reflect_on_association(:projects)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many bookings" do
    t = Client.reflect_on_association(:bookings)
    expect(t.macro).to eq(:has_many)
  end

# it 'password must be greater than or equal to 8' do
#   u = FactoryBot.create(:user)
#   expect(u.password.length).to be >= 8
# end

end
