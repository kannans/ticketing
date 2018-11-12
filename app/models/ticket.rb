class Ticket < ApplicationRecord
  serialize :date_times, JSON
  serialize :service_area, JSON
  has_one :excavator
  accepts_nested_attributes_for :excavator, reject_if: ->(attributes){ attributes['company_name'].blank? }, allow_destroy: true


  def map_coordinates
    co_text = digsite_info && digsite_info.tr('POLYGON((', '').tr(")", '') || []
    co = co_text.split(",")
    co.map { |x| x.split(" ") }.map { |x| { lat: x.first, lng: x.last } }
  end
end
