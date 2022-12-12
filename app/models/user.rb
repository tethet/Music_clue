class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_one_attached :user_icon
  # validates :email, uniqueness: true
  validates :accepted, presence: {message: 'を入力してください'}
  
  def get_user_icon
    unless user_icon.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      user_icon.attach(io:File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    user_icon.variant(resize_to_limit: [100, 100]).processed
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      where(email: word)
    elsif search == "partial_match"
      where("email LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
end

# controller側
# @user = User.find(params[:id])
# t.boolean :admin_flagがtrueの場合

# <% if @user.admin_flag == true %>
# ~~~~
# <% else %>
# ~~~~~

# <% end %>