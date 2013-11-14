class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:show]
  respond_to :json
  
  def show
    @user = User.includes(:palettes, :favorite_palettes).find(params[:id])
    render :json => @user, :include => [:palettes, :favorite_palettes],
                            :except => [:email, :created_at, :updated_at]
  end
  
  def guest_login
    user = current_or_guest_user
    sign_in_and_redirect(:user, user)
  end
end