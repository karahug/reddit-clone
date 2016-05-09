require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment) }    
  it 'has content' do
     expect(post.content).to_not be_nil 
  end
  describe "comments association" do
=begin
     let(:comment_1) { build(:comment, :no_subcomment) }
     let(:comment_2) { build(:comment, :no_subcomment) }
     let(:vote) { build(:vote) }
     it "displays highest voted comment first" do
         comment.subcomments<< comment_1
         comment.subcomments << comment_2
         comment_1.supercomment_id = comment.id
         comment_2.supercomment_id = comment.id
         vote.comment = comment_2
         vote.value = 1
         comment_1.save
         comment_2.save
         expect(post.comments).to eq([comment_2, comment_1])

     end
=end
  end
end
