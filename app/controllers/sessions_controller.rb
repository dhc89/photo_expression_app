class SessionsController < ApplicationController
  def new; end

  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id

    else

      render :new
    end
  end

  def destroy
    session[:user_id] = nil
  end
end
