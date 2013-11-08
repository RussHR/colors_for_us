class FavoritesController < ApplicationController
  respond_to :json
  
  def create
    @favorite = Favorite.new(params[:favorite])
    @favorite.giver_id = current_user.id
    
    if @favorite.save
      render :json => @favorite
    else
      render :json => @favorite.errors.full_messages, :status => 422
    end
  end
end