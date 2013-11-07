class PalettesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  
  def index
    @palettes = Palette.all.reverse
    render :json => @palettes
  end
  
  def create
    @palette = Palette.new(params[:palette])
    @palette.creator_id = current_user.id
    
    if @palette.save
      render :json => @palette
    else
      render :json => @palette.errors.full_messages, :status => 422
    end
  end
end