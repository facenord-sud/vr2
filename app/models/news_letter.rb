class NewsLetter < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true#, format: {whith: VALID_EMAIL_REGEX}
end
