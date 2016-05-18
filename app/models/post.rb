class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    has_many :votes
    
    validates :user_id, presence: true
    validates :title, presence: true
    
    validate :content_or_link
    
    default_scope {order(:votecount => :desc)}

  private
    def content_or_link
        if content.blank? && link.blank?
            errors[:base] << "Specify content, link or both."
        end
    end
end
