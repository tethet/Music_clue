class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = current_user.comment.new(comment_params)
    # comment = current_user.post_comments.new(post_comment_params)
    @comment.review_id = review.id
    # comment.post_image_id = post_image.id
    @comment.save
    redirect_to review_path(@review)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
