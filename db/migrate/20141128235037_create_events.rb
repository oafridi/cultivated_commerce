class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :address_line_1
      t.string :city
      t.string :zipcode
      t.string :state
      t.date :date
      t.string :time
      t.string :title
      t.string :description
      t.string :image

      t.float :latitude
      t.float :longitude

      t.references :user

      t.timestamps
    end
  end
end
