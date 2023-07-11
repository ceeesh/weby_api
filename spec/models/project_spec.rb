require 'rails_helper'

RSpec.describe Project, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "should have many projects" do
    t = Project.reflect_on_association(:transactions)
    expect(t.macro).to be(:has_many)
  end

  it "shouldn't only have one" do
    t = Project.reflect_on_association(:transactions)
    expect(t.macro).not_to be(:has_one)
  end

end
