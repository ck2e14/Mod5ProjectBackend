class Api::V1::BlacklistsController < ApplicationController

   def index
      @blacklisted = Blacklist.all
      render json: @blacklisted
   end

   def show
      @blacklisted = Blacklist.find_by(id:params[:id])
      render json: @blacklisted
   end

   def create
      @blacklisted = Blacklist.create(blacklist_params)
      if @blacklisted.valid? 
         render json: { blacklist: BlacklistSerializer.new(@blacklisted) }, status: :created
      else
         render json: { error: 'Failed to blacklist this establishment. Please try again.' }, status: :not_acceptable
      end
   end

   def destroy
      @blacklisted = Blacklist.find_by(user_id:params[:id])
   end

   private
   def blacklist_params
      params.require(:blacklist).permit(:user_id, :establishment_id)
   end


end
