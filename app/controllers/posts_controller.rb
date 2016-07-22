class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :edit, :new, :destroy, :index]
  
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
    Vote.new(post_id: @post.id, value: 1, user_id: current_user.id).save
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
    @posts.each do |p|
      count_votes(p)
    end
  end
  
  def post_params
    params.require(:post).permit(:title, :content, :link)
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    @comments.each {|c| count_votes(c)}
  end
  
  def count_votes(post)
    post.votecount = post.votes.sum(:value)
    post.save
  end
end
