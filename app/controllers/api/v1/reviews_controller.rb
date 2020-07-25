class Api::V1::ReviewsController < ApplicationController
   def index
      @reviews = Review.all
      render json: @reviews
   end

   def show
      @review = Review.find(params[:id])
      # need to actually provide a render here lol
   end

   def create
      @review = Review.create(review_params)
      if @review.valid? 
         render json: { review: ReviewSerializer.new(@review) }, status: :created
      else
         render json: { error: 'Failed to generate review. Please try again.' }, status: :not_acceptable
      end
   end


   private 
   def review_params
      params.require(:review).permit(:rating, :content, :user_id, :establishment_id)
   end
end
