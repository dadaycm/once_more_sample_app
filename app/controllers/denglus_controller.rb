class DenglusController < ApplicationController
  def new
  end

    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        puts "[{LHY- denglusCtroller:create]#{params[:session].to_yaml}[LHY}]"
        log_in user
        redirect_to user
      else
        flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
    end

    def destroy
      log_out
      redirect_to root_url
    end
end
