class SessionsController < ApplicationController


  def create
    auth = AuthenticateUser.build( env["omniauth.auth"] )

    if auth.save
      session[:user_id] = auth.user.id

      redirect_to "/secret",
        notice: "yeyy got there with omniauth and #{params[:provider]} as provider !"
    else
      render text: "failed sorry try again"
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You got outa omni box"
  end
end
