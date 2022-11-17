class HomesController < ApplicationController
  def top
    @reviews = Review.page(params[:page])
  end

  def agreement
  end
end
