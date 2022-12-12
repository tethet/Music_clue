class SearchesController < ApplicationController
 def search
    @range = params[:range]

    if @range == "User"
      # logger.debug '------------------------------------'
      # logger.debug params[:search]
      # logger.debug params[:word]
      # logger.debug '------------------------------------'
      @users = User.looks(params[:search], params[:word])
      # redirect_to xxx_path if/unless
    else
      @reviews = Review.looks(params[:search], params[:word])
    end
 end
end
