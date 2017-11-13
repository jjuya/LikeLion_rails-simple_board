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
  
  def login
  end
  
  def login_process
    input_email = params[:u_email]
    input_password = params[:u_password]
    
    user = User.find_by(email: input_email)
    
    if user
      if user.password == input_password
        session[:user_id] = user.id
        session[:msg] = "#{user.email} 님 환영합니다."
        
        flash[:notice] = "로그인 성공"
        
        redirect_to '/'
      else
        flash[:notice] = "로그인 실패"
        
        redirect_to '/user/login'
      end
    else
      flash[:notice] = "로그인 실패"
      
      redirect_to '/user/login'
    end
  end
  
  
  def logout
    session.clear
    
    flash[:notice] = "로그아웃 성공"
    
    redirect_to '/'
  end
end
