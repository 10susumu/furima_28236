class CreateUsersItems < ActiveRecord::Migration[6.0]
  def change
    create_table :users_items do |t|
      t.references :user, nil: false
      t.references :item, nil: false
      t.timestamps
    end
  end
end
