class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :email, null: false, default: ""
      t.string :address_line_1
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :latitude      
      t.string :longitude
      t.string :about
      t.string :user_img, default: "chris.jpg"
      t.string :phone
      t.boolean :private_contact

      t.timestamps
    end
  end
end
