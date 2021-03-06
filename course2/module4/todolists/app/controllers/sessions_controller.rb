class SessionsController < ApplicationController
  # GET /sessions/new
  def new
  end

  # POST /sessions
  # POST /sessions.json
  def create
    user = User.find_by_username(sessions_params[:username])

    if user && user.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      redirect_to login_path, alert: "Invalid username/password combination"
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    reset_session # wipe out session and everything in it
    redirect_to login_path, notice: "You have been logged out"
  end

  private
    def sessions_params
      params.require(:user).permit(:username, :password)
    end
end
