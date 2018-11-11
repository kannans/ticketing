class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :contact_center
      t.string :reference_request_number
      t.string :request_number
      t.integer :version_number
      t.integer :sequence_number
      t.string :request_type
      t.string :request_action
      t.text :date_times
      t.text :service_area
      t.text :digsite_info
      t.timestamps
    end
  end
end
