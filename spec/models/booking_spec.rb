require 'rails_helper'

RSpec.describe Booking, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "should have one project" do
    t = Booking.reflect_on_association(:client)
    expect(t.macro).to eq(:belongs_to)
  end

end
