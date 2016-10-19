class PasswordResetsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]    # Case (1)

  def new
  end

  def create
    logger.info "[LHY]PasswordResetsController::create #{params}"
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      logger.info "[LHY]#{@user}"
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
    logger.info "[LHY]PasswordResetsController::edit #{params}"
  end

  def update
    logger.info "[LHY]PasswordResetsController::update #{params}"
    if params[:user][:password].empty?                  # Case (3)
      logger.info "[LHY]case3"
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)          # Case (4)
      logger.info "[LHY]case4"
      log_in @user
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      logger.info "[LHY]case2"
      render 'edit'                                     # Case (2)
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    # Before filters

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      unless (@user && @user.activated? &&
              @user.authenticated?(:reset, params[:id]))
        logger.info "[LHY]PasswordResetsController::valid_user, no pass"
        logger.info "[LHY]#{params} "
        logger.info "[LHY]@user=#{@user} "
        logger.info "[LHY]@user.activated=#{@user.activated} "
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
