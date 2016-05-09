class Vote < ActiveRecord::Base
    belongs_to :post
    belongs_to :comment_2
    belongs_to :user
end
