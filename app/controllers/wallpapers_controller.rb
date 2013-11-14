class WallpapersController < ApplicationController
  def show
    @palette = Palette.find(params[:palette_id])
    @each_width = params[:width].to_f / @palette.num_of_colors
    render :show
  end
end