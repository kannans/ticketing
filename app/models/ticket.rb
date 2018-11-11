class Ticket < ApplicationRecord
  serialize :date_times, HASH
  serialize :service_area, HASH
end
