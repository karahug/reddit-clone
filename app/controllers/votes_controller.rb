class VotesController < ApplicationController
  before_filter :authenticate_user!
  def create
    @vote = Vote.new(vote_params)
    @vote.user_id = current_user.id
    Vote.where(user_id: @vote.user, post_id: @vote.post_id, comment_id: @vote.comment_id).each do |x|
        x.destroy
    end
    @vote.save

    respond_to do |format|
      format.html{redirect_to root_path}
      format.js {}
    end

  end
  def destroy

    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html {redirect_to root_path }
      format.js {}
    end
  end

  def edit
    @vote = Vote.find(params[:id])
  end
=begin
  def update
    @vote = Vote.find(params[:id])
    @vote.update_attributes(vote_params)
    @vote.save
    redirect_to @vote.post if not @vote.post.nil?
    redirect_to @vote.comment if not @vote.comment.nil?
  end
=end
  def vote_params
    params.require(:vote).permit(:value, :user_id, :post_id, :comment_id)
  end

    def update
        vote = Vote.new(vote_params)
        vote[:user_id] = current_user.id
        existingVote  = Vote.where(user_id: current_user.id,  post_id: vote.post_id,
            comment_id: vote.comment_id)[0]
        response = {}
        if existingVote && (existingVote.value == vote.value)
            existingVote.destroy
            response[:voteValue] = 0
        elsif existingVote
            existingVote.destroy
            vote.save
            response[:voteValue] = vote.value
        else
            vote.save
            response[:voteValue] = vote.value
        end
        parent = vote.comment_id ? Comment.where(id: vote.comment_id)[0] :
            Post.where(id: vote.post_id)[0]
        voteSum = parent.votes.sum(:value)
        parent.votecount = voteSum
        parent.save
        response[:voteCount] = voteSum
        respond_to do |format|
            format.json { render json: response }
        end
    end
end
