class User < ActiveRecord::Base
  has_many :ideas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :ideas_likes, through: :likes, source: :likes
  has_secure_password

  before_validation :email_lowercase
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, :alias, presence: true, length: {minimum: 3}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :password, presence: true, length: {minimum: 8}

  private
    def email_lowercase
      self.email.downcase!
    end
end
