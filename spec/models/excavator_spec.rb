require "rails_helper"

RSpec.describe Excavator, type: :model do
  context "associations" do
    it { should belong_to(:ticket) }
  end
end
