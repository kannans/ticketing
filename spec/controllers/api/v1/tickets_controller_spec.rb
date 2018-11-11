require "rails_helper"

describe Api::V1::TicketsController do
  context "#create" do
    it "should recived ticket params and store in to database" do

      post :create, params: fake_ticket_params

      expect(response.status).to eq 201
      expect(Ticket.all.size).to eq(1)
      expect(Ticket.last.contact_center).to eq("UPCA")
    end
  end

  def fake_ticket_params
    {
      "ContactCenter": "UPCA",
      "RequestNumber": "09252012-00001",
      "ReferenceRequestNumber": "",
      "VersionNumber": "0",
      "SequenceNumber": "2421",
    }
  end
end