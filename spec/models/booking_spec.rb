require 'rails_helper'

RSpec.describe Booking, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "belongs to client" do
    t = Booking.reflect_on_association(:client)
    expect(t.macro).to be(:belongs_to)
  end

  it "shouldn't have many client" do
    t = Booking.reflect_on_association(:client)
    t.macro
    expect(t.macro).not_to eq(:has_many)
  end

end
