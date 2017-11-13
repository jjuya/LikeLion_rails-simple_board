class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    if !session[:user_id]
      redirect_to '/user/login'
    end
  end

  def create
    input_title = params[:p_title]
    input_content = params[:p_content]
    
    if session[:user_id]
      writter = session[:user_id]
      
      Post.create(
        user_id: writter,
        title: input_title,
        content: input_content
      )
      
      redirect_to '/'
    else
      redirect_to '/user/login'
    end
    
  end

  def show
    input_id = params[:id]
    
    @post = Post.find(input_id)
  end
  
  def destroy
    if !session[:user_id]
      redirect_to '/user/login'
    else
      input_id = params[:id]
      
      if session[:user_id] == Post.find(input_id).user_id
        Post.destroy(input_id)
        redirect_to '/'
      else
        redirect_to "/post/show/#{input_id}"
      end
    end
  end
  
  def modify
    
    if !session[:user_id]
      redirect_to '/user/login'
    else
      input_id = params[:id]
      
      @post = Post.find(input_id)
      
      if session[:user_id] != @post.user_id
        redirect_to "/post/show/#{input_id}"
      end
    end
  end
  
  def update
    
    if !session[:user_id]
      redirect_to '/user/login'
    else
      input_id = params[:id]
      
      @post = Post.find(input_id)
      
      if session[:user_id] == @post.user_id
        input_title = params[:p_title]
        input_content = params[:p_content]
        
        @post.update(
          title: input_title,
          content: input_content
        )
      end
      
      redirect_to "/post/show/#{input_id}"
    end
  end
end
