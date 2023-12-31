class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create 
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = 'Post successfully created'
      redirect_to posts_path
    else 
      flash.now[:notice] = 'Something went wrong'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:publication)
  end
end
