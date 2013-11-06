class RootController < ApplicationController
  def root
    if user_signed_in?
      render :root
    else
      redirect_to new_user_session_url
    end
  end
end
