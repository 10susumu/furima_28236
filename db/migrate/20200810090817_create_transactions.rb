class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :user, nil: false
      t.references :item, nil: false
      t.timestamps
    end
  end
end
