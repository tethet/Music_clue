class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to top_path
  end

  def show
    @review = Review.find(params[:id])
    @review_user = @review.user
    @comment = Comment.new
    @comments = Comment.page(params[:page])
    
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
   redirect_to top_path
  end
  
  private
  def review_params
    params.require(:review).permit(:music_title, :music_url, :music_artist_name, :music_genre, :music_review)
  end
end
