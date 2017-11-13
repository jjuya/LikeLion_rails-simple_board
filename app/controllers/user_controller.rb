class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    input_email = params[:u_email]
    input_password = params[:u_password]
    
    User.create(
      email: input_email,
      password: input_password
    )
    
    redirect_to '/'
  end

  def show
    input_id = params[:id]
    
    @user = User.find(input_id)
  end
end
