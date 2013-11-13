class PalettesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  
  def index
    @palettes = Palette.includes(:favorites, :creator).all.reverse
    render :json => @palettes, :include => [:favorites, :creator]
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
  
  def show
    @palette = Palette.includes(:favorites, :creator).find(params[:id])
    render :json => @palette, :include => [:favorites, :creator]
  end
end