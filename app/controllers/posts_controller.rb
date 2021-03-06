class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @writer = User.find(@post.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :publisher, :category)
  end
end
