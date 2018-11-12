require "rails_helper"

RSpec.describe Ticket, type: :model do
  context "associations" do
    it { should have_one(:excavator) }
    it{ should accept_nested_attributes_for :excavator }
  end

  context "#map_coordinates" do
    it "should return co-ordinate values to ploygon map as json" do
      ticket = create(:ticket)

      expect(ticket.map_coordinates).to_not be_empty
      expect(ticket.map_coordinates.first.class).to be(Hash)
      expect(ticket.map_coordinates.first[:lat]).to_not be_nil
      expect(ticket.map_coordinates.first[:lng]).to_not be_nil
    end

    it "should return empty if digsite_info values not present" do
      ticket = create(:ticket, digsite_info: "")

      expect(ticket.map_coordinates).to be_empty
    end
  end
end
