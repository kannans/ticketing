class Ticket < ApplicationRecord
  serialize :date_times, JSON
  serialize :service_area, JSON
  has_one :excavator
  accepts_nested_attributes_for :excavator, reject_if: ->(attributes){ attributes['company_name'].blank? }, allow_destroy: true
end
