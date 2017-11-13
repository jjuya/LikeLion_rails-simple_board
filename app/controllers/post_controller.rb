class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    input_title = params[:p_title]
    input_content = params[:p_content]
    
    Post.create(
      title: input_title,
      content: input_content
    )
    
    redirect_to '/'
  end

  def show
    input_id = params[:id]
    
    @post = Post.find(input_id)
  end
  
  def destroy
    input_id = params[:id]
    
    Post.destroy(input_id)
    
    redirect_to '/'
  end
  
  def modify
    input_id = params[:id]
    
    @post = Post.find(input_id)
  end
  
  def update
    input_id = params[:id]
    input_title = params[:p_title]
    input_content = params[:p_content]
    
    @post = Post.find(input_id)
    
    @post.update(
      title: input_title,
      content: input_content
    )
    
    redirect_to "/post/show/#{input_id}"
  end
end
