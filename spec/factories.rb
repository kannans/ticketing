FactoryBot.define do
  factory :ticket do
    contact_center "UPCA"
    reference_request_number "RWE124"
    request_number  "09252012-00001"
    version_number 0
    sequence_number 2421
    request_type "Normal"
    request_action "Restake"
    date_times {}
    service_area {}
    digsite_info "POLYGON((-81.13390268058475\n      32.07206917625161,-81.14660562247929 32.04064386441295))"
  end

  factory :excavator do
    sequence(:company_name) { |i| "John Doe CONSTRUCTION #{i}" }
    address "555 Some RD"
    city "SOME PARK"
    state "ZZ"
    zip "55555"
    type "Excavator"
    contact {}
    field_contact {}
    excavation_info {}
    crew_onsite true
    ticket
  end
end
