class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:show]
  respond_to :json
  
  def show
    @user = User.includes(:palettes, :favorite_palettes).find(params[:id])
    render :json => @user, :include => [:palettes, :favorite_palettes],
                            :except => [:email, :created_at, :updated_at]
  end
  
  def guest_login
    guest = User.find_by_username("guest")
    guest.palettes.destroy_all
    guest.favorites.destroy_all
    
    sign_in_and_redirect(:user, guest)
  end
end