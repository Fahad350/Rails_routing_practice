class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def publish
  @post = Post.find(params[:id])
  end

  
end
