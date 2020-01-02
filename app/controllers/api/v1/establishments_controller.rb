class Api::V1::EstablishmentsController < ApplicationController
   def index
      @establishments = Establishment.all
      render json: @establishments
   end

   def show
      @establishment = Establishment.find(params[:id])   
      render json: @establishment
   end
   def create
      @establishment = Establishment.create(establishment_params)
      if @establishment.valid?
         render json: { establishment: EstablishmentSerializer.new(@establishment) }, status: :created
       else
         render json: { error: 'Failed to create this establishment. Please try again.' }, status: :not_acceptable
      end
   end

   private
   def establishment_params
      params.require(:establishment).permit(:name, :location, :type_of, :latitude, :longitude, :localAuth, :postcode, :ratingValue, :ratingDate)
   end
   
end
