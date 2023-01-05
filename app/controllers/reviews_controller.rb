class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @review = Review.find(params[:id])
    @review_user = @review.user
    @comment = Comment.new
    #@comments = Comment.order(created_at: "DESC").page(params[:page])
    @comments = @review.comments.order(created_at: "DESC").page(params[:page])
    
  end

  def edit
   @review = Review.find(params[:id])
   
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to review_path(@review.id)
  end

  def destroy
   @review = Review.find(params[:id])
   @review.destroy
   redirect_to root_path
  end
  
  private
  def review_params
    params.require(:review).permit(:music_title, :music_url, :music_artist_name, :music_genre, :music_review)
  end
end
