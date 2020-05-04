class RemoveImageFileNameFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :image_file_name, :image
  end
end

 