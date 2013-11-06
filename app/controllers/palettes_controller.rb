class PalettesController < ApplicationController
  respond_to :json
  
  def index
    @palettes = Palette.all
    render :json => @palettes
  end
end
