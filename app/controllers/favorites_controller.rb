class FavoritesController < ApplicationController
  def index
    @review = Review.find(params[:review_id])
  end

  def create
  end

  def destroy
  end
end
