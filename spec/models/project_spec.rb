require 'rails_helper'

RSpec.describe Project, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "should have many projects" do
    t = Project.reflect_on_association(:transactions)
    expect(t.macro).to eq(:has_many)
  end

end
