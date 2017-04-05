class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      # t.string :email
      # t.string :password
      t.string :phone
      t.string :address
      t.string :city
      # t.has_attached_file :file
      t.string :file
      t.string :credentials
      t.string :nickname
      t.string :provider
      t.string :url

      t.timestamps
    end
  end
end
