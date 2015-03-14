class RenameUserImginUsertoImg < ActiveRecord::Migration
  def change
     rename_column :users, :user_img, :img
  end
end
