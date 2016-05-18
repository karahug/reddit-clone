class Comment < ActiveRecord::Base
    belongs_to :post
    belongs_to :user
    belongs_to :supercomment, :class_name => "Comment", foreign_key: "supercomment_id"
    has_many :votes
    has_many :subcomments, :class_name => "Comment", foreign_key: "subcomment_id"
    
    validates :user_id, presence: true
    validates :content, presence: true
    
    default_scope {order(:votecount => :desc)}
end