class Review < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
 def favorited_by?(user)
    favorites.exists?(user_id: user.id)
 end
 
 def self.looks(search, word)
    if search == "perfect_match"
      @review = Review.where("music_title LIKE? OR music_url LIKE?","music_artist_name LIKE? OR music_genre LIKE? OR music_review LIKE?","#{word}","#{word}")
    elsif search == "partial_match"
      @review = Review.where("music_title LIKE? OR music_url LIKE?","music_artist_name LIKE? OR music_genre LIKE? OR music_review LIKE?","#{word}","#{word}")
    else
      @review = Review.all
    end
 end
end
