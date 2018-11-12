class Ticket < ApplicationRecord
  serialize :date_times, JSON
  serialize :service_area, JSON
  has_one :excavator
  accepts_nested_attributes_for :excavator, reject_if: ->(attributes){ attributes['company_name'].blank? }, allow_destroy: true

  def map_coordinates
    array_info = digsite_info_polygon_data.split(',')
    array_info.map { |x| x.split(" ") }.map { |x| { lat: x.first, lng: x.last } }
  end

  def digsite_info_polygon_data
    digsite_info_text = digsite_info && digsite_info.tr('POLYGON((', '').tr(')', '') || []
  end
end
