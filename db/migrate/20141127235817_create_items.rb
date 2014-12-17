class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :kind
      t.string :category

      t.timestamps
    end
  end
end
