class ApplicationController < ActionController::Base
  protect_from_forgery

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      if session[:guest_user_id]
        guest_user.destroy
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session or create one
  # if necessary
  def guest_user
    # cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
     session[:guest_user_id] = nil
     guest_user
  end

  private

  def create_guest_user
    user = User.new(
      :username => "guest#{Time.now.to_i}#{rand(99)}", 
      :email => "guest#{Time.now.to_i}#{rand(99)}@example.com"
    )
    
    user.save!(:validate => false)
    session[:guest_user_id] = user.id
    user
  end
end