class HomesController < ApplicationController
  def top
    @reviews = Review.order(created_at: "DESC").page(params[:page])
  end

  def agreement
  end
end
