class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
       t.integer :user_id,             null: false, default: ""
       t.integer :comment_id,          null: false, default: ""
       t.integer :favorite_id,         null: false, default: ""
       t.string :music_title,          null: false, default: ""
       t.string :music_url,            null: false, default: ""
       t.string :music_artist_name,    null: false, default: ""
       t.string :music_genre,          null: false, default: ""
       t.string :music_review,         null: false, default: ""
      t.timestamps
    end
  end
end
# 