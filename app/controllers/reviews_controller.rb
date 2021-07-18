class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @client = Client.find(params[:client_id])
    @reviews = @client.reviews
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to client_path(@review.client)
    else
      @client = Client.find(params[:client_id])
      render "clients/show"
    end
  end
  
  private
  
    def review_params
      params.permit(:client_id, :score, :content)
    end
end
