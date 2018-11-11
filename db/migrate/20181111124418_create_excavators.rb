class CreateExcavators < ActiveRecord::Migration[5.2]
  def change
    create_table :excavators do |t|
      t.string :company_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :type
      t.text :contact
      t.text :field_contact
      t.text :excavation_info
      t.boolean :crew_onsite
      t.belongs_to :ticket, index: true

      t.timestamps
    end
  end
end
