class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.float :latitude
      t.float :longitude
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :postal_code
      t.string :state
      t.string :country
      t.string :owner_name
      t.integer :contact_time
      t.integer :phone_number

      t.timestamps null: false
    end
  end
end
