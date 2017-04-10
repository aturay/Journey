class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :phone
      t.string :city
      t.attachment :file
      t.string :credentials
      t.datetime :blocked_date

      t.string :nickname
      t.string :provider
      t.string :url

      t.timestamps
    end
  end
end
