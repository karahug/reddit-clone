class User < ActiveRecord::Base
  has_many :posts
  has_many :votes
  has_many :comments
  
  validates :name, presence: true
  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
