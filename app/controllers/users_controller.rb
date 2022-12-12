class UsersController < ApplicationController
   before_action :set_user, only: [:favorite]
   before_action :user_admin_flag, only: [:ending]
  
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to top_path
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  def favorite
    favorites = Favorite.where(user_id: @user.id).pluck(:review_id)
    @favorite_posts = Review.find(favorites)
  end


  def ending
  　byebug
  　puts "==================================================="
    @user = User.find(params[:id])
  end
  
  
  
  private
  def user_params
    params.require(:user).permit(:email, :user_icon)
  end 
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_admin_flag
    @user = User.find(params[:id])
    if current_user.admin_flag == false
      redirect_to top_path
    else
      render action: "ending"
    end
  end
end
