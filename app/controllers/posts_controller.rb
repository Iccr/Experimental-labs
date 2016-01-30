class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create

    post = Post.new(post_params)
    if post.save
      flash[:msg]= "post created"
    else
      flash[:msg]= "post failed"
    end
    redirect_to posts_path
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      flash[:msg]= "post created"
    else
      flash[:msg]= "post failed"
    end
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy(post_params)
      flash[:msg]= "post deleted"
    else
      flash[:msg]= "cant delete this post"
    end
    redirect_to root_path
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
