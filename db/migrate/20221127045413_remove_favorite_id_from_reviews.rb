class RemoveFavoriteIdFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :favorite_id, :integer
  end
end
