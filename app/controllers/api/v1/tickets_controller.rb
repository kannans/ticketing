class Api::V1::TicketsController < Api::V1::BaseController

  def create
    ticket = Ticket.new(ticket_params)
    if ticket.save
      json_response(ticket, :created)
    else
      json_response(ticket.errors, :unprocessable_entity)
    end
  end

  private

  def update_ticket_params
    task_params = params.clone
    all = symbolize_recursive(task_params)
    all.tap do |hash_item|
      hash_item[:excavator][:excavation_info] = hash_item[:excavation_info] if hash_item[:excavator].present?
      hash_item[:excavator_attributes] = hash_item[:excavator]
      hash_item[:digsite_info] = hash_item[:excavation_info] && hash_item[:excavation_info][:digsite_info] && hash_item[:excavation_info][:digsite_info][:well_known_text]
    end
    all.delete :excavator
    all.delete :excavation_info
    ActionController::Parameters.new(all)
  end

  def ticket_params
    update_ticket_params.permit(permitted_parameters)
  end

  def permitted_parameters
    [
      :contact_center, :request_number, :reference_request_number, :version_number, :sequence_number, :request_type, :request_action, :date_times, :service_area, :digsite_info,
      excavator_attributes: [:company_name, :address, :city, :state, :zip, :type, :contact, :field_contact, :crew_onsite, :excavation_info]
    ]
  end
end
