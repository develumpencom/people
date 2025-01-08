class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def current_user
    Rails.env.development? ?
      User.first :
      User.find_by(id: session[:user_id])
  end
end
