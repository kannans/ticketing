require "rails_helper"


RSpec.describe 'Tickets', type: :request do
  let!(:tickets) { create_list(:ticket, 10) }

  describe 'GET /ticktes' do
    before { get '/tickets' }

    it 'returns tickets' do
      expect(response.body).not_to be_empty
      expect(response.body).to include(tickets.first.contact_center)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /ticktes/:id' do
    before { get ticket_path(tickets.first) }

    it 'returns ticket details' do
      expect(response.body).not_to be_empty
      expect(response.body).to include(tickets.first.contact_center)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end