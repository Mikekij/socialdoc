class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :homepage_url
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :personal_phone
      t.string :email

      t.timestamps null: false
    end
  end
end
