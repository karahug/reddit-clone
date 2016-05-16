class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :edit, :new, :destroy]
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    @post.save
    redirect_to @post
  end

  def new
    @post = Post.new
  end

  def upvote
  end

  def downvote
  end
  
  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    @post.save
    redirect_to @post
  end
  
  def destroy
    @post = Post.find(params[:id])
    if current_user == @post.user
      @post.destroy
      redirect_to root_path
    end
    nil
  end
  
  
  def index
    @posts = Post.all
  end
  
  def post_params
    params.require(:post).permit(:title, :content, :link)
  end
  
  def show
  end
end
