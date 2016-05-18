class VotesController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @vote = Vote.new(vote_params)
    @vote.user_id = current_user.id
    Vote.where(user_id: @vote.user, post_id: @vote.post_id, comment_id: @vote.comment_id).each do |x|
        x.destroy
    end
    @vote.save
    redirect_to :back
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
  end

  def edit
    @vote = Vote.find(params[:id])
  end

  def update
    @vote = Vote.find(params[:id])
    @vote.update_attributes(vote_params)
    @vote.save
    redirect_to @vote.post if not @vote.post.nil?
    redirect_to @vote.comment if not @vote.comment.nil?
  end
  
  def vote_params
    params.require(:vote).permit(:value, :user_id, :post_id, :comment_id)
  end
  
  def unvote
    @vote = Vote.new(vote_params)
    Vote.where(user_id: current_user.id, post_id: @vote.post_id, comment_id: @vote.comment_id).each {|v| v.destroy }
    redirect_to :back
  end
end
