class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Idea Factory #{@user.first_name}!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:alert] = "Try again: #{@user.errors.full_messages.join(', ')}"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
