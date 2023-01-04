class Review < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
 def favorited_by?(user)
   if user.present?
    favorites.exists?(user_id: user.id)
   else
    false
   end
    
 end
 
 def self.looks(search, word)
    if search == "perfect_match"
      @review = Review.or(where(music_title: word))
                      .or(where(music_url: word))
                      .or(where(music_artist_name: word))
                      .or(where(music_genre: word))
                      .or(where(music_review: word))
    elsif search == "partial_match"
      @review = Review.or(where(music_title: word))
                      .or(where(music_url: word))
                      .or(where(music_artist_name: word))
                      .or(where(music_genre: word))
                      .or(where(music_review: word))
    else
      @review = Review.all
    end
 end
end
