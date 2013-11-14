class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  
  def show
    @user = User.includes(:palettes, :favorite_palettes).find(params[:id])
    render :json => @user, :include => [:palettes, :favorite_palettes],
                            :except => [:email, :created_at, :updated_at]
  end
end