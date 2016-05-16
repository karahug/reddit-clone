class Vote < ActiveRecord::Base
    belongs_to :post
    belongs_to :comment
    belongs_to :user
    
    validates :value, presence: true
    validates :user_id, presence: true
end
