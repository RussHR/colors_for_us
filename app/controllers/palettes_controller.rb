class PalettesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  
  def index
    @palettes = Palette.all.reverse
    render :json => @palettes
  end
end
