class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @review = @user.review
    @reviews = @review.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def ending
  end
  
  private
  def user_params
    params.require(:user).permit(:user_name, :user_icon)
  end 
end
