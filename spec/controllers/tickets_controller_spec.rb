require "rails_helper"

RSpec.describe TicketsController, type: :controller do
  context "#index" do
    it "should list all the tickets and render breadcrumb" do
      tickets = create_list(:ticket, 5)

      get :index

      expect(response).to have_http_status(:ok)
      expect(assigns(:tickets).size).to eq(5)
    end
  end

  context "#show" do
    it "should show the ticket details" do
      ticket = create(:ticket)

      get :show, params: { id: ticket.id }

      expect(response).to have_http_status(:ok)
      expect(assigns(:ticket)).to_not be_nil
    end
  end

  context "#destroy" do
    it "should show the ticket details" do
      ticket = create(:ticket)

      expect(Ticket.all.size).to eq(1)

      delete :destroy, params: { id: ticket.id }

      expect(Ticket.all.size).to eq(0)
      expect(response).to have_http_status(:found)
    end
  end
end
