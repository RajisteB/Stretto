class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if user_signed_in?
      user = current_user.id
      profile_path(user)
    else
      new_user_session_path
  end
end
end
