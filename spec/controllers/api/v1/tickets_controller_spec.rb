require "rails_helper"

describe Api::V1::TicketsController do
  context "#create" do
    it "should recived ticket params and store in to database" do

      post :create, params: fake_ticket_params

      expect(response.status).to eq 201
      expect(Ticket.all.size).to eq(1)
      expect(Ticket.last.contact_center).to eq("UPCA")

      data = JSON.parse(response.body)
      expect(data["contact_center"]).to eq("UPCA")
    end

    it "should not create ticket if require fields not presents on the parameters" do

      post :create, params: {}

      data = JSON.parse(response.body)
      expect(response.status).to eq(422)
      expect(data["contact_center"]).to include("can't be blank")
      expect(data["request_number"]).to include("can't be blank")
    end
  end

  def fake_ticket_params
    {
      "ContactCenter": "UPCA",
      "RequestNumber": "09252012-00001",
      "ReferenceRequestNumber": "",
      "VersionNumber": "0",
      "SequenceNumber": "2421",
      "ServiceArea": {
        "PrimaryServiceAreaCode": {
        "SACode": "ZZGL103"
        },
        "AdditionalServiceAreaCodes": {
        "SACode": [
          "ZZL01",
          "ZZL02",
          "ZZL03"
          ]
        }
      },
      "Excavator": {
        "CompanyName": "John Doe CONSTRUCTION",
        "Address": "555 Some RD",
        "City": "SOME PARK",
        "State": "ZZ",
        "Zip": "55555",
        "Type": "Excavator",
        "Contact": {
            "Name": "Johnny Doe",
            "Phone": "1115552345",
            "Email": "example@example.com"
        },
        "FieldContact": {
          "Name": "Field Contact",
          "Phone": "1235557924",
          "Email": "example@example.com"
        },
        "CrewOnsite": "true"
      },
    }
  end
end