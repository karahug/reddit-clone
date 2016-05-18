class CommentsController < ApplicationController
  before_filter :authenticate_user!
  
  def update
  end

  def edit
  end

  def destroy
  end

  def reply
    @comment = Comment.new
    @supercomment = Comment.find(params[:comment][:supercomment_id])
    @post = Post.find(params[:comment][:post_id])
  end

  def upvote
  end

  def downvote
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    count_votes(@comment)
    
    redirect_to @comment.post
  end
  
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content, :supercomment_id)
  end
  def count_votes(comment)
    comment.votecount = 1 + comment.votes.sum(:value)
    comment.save
  end
end
