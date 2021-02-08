class RemoveUserFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :blog_id, :string
  end
end
