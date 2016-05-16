class PostsController < ApplicationController
  before_filter :authenticate_user!
  
  def edit
  end

  def update
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
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end
  
  def destroy
  end
  
  
  def index
    @posts = Post.all
  end
  
  def post_params
    params.require(:post).permit(:title, :content, :author, :link)
  end
  
  def edit
  end
end
