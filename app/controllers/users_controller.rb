class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    debugger if Rails.env.development?
  end

  def new
    @user = User.new
    debugger  if Rails.env.development?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
