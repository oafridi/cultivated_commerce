class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.string :desired
      t.string :quantity
      t.string :image, default:"orange2.jpg"
      t.boolean :active
      t.belongs_to :item

      t.references :user

      t.timestamps
    end
  end
end