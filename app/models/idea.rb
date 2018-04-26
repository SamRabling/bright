class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :user_liked, through: :likes, source: :user

  validates :post, presence: true, length: {minimum: 10}
end
