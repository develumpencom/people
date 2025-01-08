class SessionsController < ApplicationController
  def create
    user = User.find(params.expect(:user_id))

    session[:user_id] = user.id
  end
end
