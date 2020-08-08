class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,                  nil: false
      t.string     :inages,                nil: false
      t.string     :name,                  nil: false
      t.text       :description,           nil: false
      t.integer    :price,                 nil: false
      t.integer    :category_id,           nil: false
      t.integer    :status_id,             nil: false
      t.integer    :shipping_charges_id,   nil: false
      t.integer    :shipping_region_id,    nil: false
      t.integer    :day_until_shipping_id, nil: false
      t.timestamps
    end
  end
end
