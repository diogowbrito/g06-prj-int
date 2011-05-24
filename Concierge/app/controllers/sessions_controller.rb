class SessionsController < ApplicationController

  def new
  end

  def create
    @msg = ""
    user = User.authenticate(params[:username], params[:password])
    if user
      if user.activateCode == -1 then
        session[:user_id] = user.id
        redirect_to :root
      else
        @msg = "Your account needs activation. Go to your email and do it!"
        render "new"
      end
    else
      @msg = "Username/Password combination error."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

end
