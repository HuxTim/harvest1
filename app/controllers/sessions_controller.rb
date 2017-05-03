class SessionsController < ApplicationController

  def new
    render 'welcome/new'
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      # Create an error message.
      redirect_to sessions_new_path, :flash => { :error => 'Invalid email/password combination'}
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
