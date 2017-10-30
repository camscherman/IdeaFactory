class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      flash[:notice] = "You have signed in!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new, alert: "Either your username or password is incorrect."
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to root_path
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
