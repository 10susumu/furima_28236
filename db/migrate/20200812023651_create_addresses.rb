class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :item,           nil: false
      t.string     :postal_code,    nil: false
      t.integer    :prefectures_id, nil: false
      t.string     :city,           nil: false
      t.string     :address_line1,  nil: false
      t.string     :address_line2,  nil: false
      t.string     :phone_number,   nil: false
      t.timestamps
    end
  end
end
