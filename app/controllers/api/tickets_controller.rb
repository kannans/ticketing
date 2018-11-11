class TicketsController < BaseController
  before_action :update_ticket_params, only: :create

  def create
    ticket = Ticket.create!(ticket_params)
    json_response(object, status = :ok)
  end

  private

  def update_ticket_params
    params = symbolize_recursive(params[:ticket])
    params.tap do |p|
      p[:excavator][:excavation_info] = p[:excavation_info]
      p[:excavator_attributes] = p[:excavator]
      p[:digsite_info] = p[:excavation_info] && p[:excavation_info][:digsite_info] && p[:excavation_info][:digsite_info][:well_known_text]
    end
    params.delete :excavator
    params.delete :excavation_info
  end

  def ticket_params
    params.require(:ticket).permit(permitted_parameters)
  end

  def permitted_parameters
    [
      :contact_center, :request_number, :reference_request_number, :version_number, :sequence_number, :request_type, :request_action, :date_times, :service_area, :digsite_info,
      excavator_attributes: [:company_name, :address, :city, :state, :zip, :type, :contact, :field_contact, :crew_onsite, :excavation_info]
    ]
  end
end
