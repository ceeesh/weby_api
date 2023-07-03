require 'rails_helper'

RSpec.describe Transaction, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "should have one project" do
    t = Transaction.reflect_on_association(:project)
    expect(t.macro).to eq(:belongs_to)
  end
  
end
