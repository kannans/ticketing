class Excavator < ApplicationRecord
  serialize :contact, JSON
  serialize :field_contact, JSON
  serialize :excavation_info, JSON

  belongs_to :ticket
end
