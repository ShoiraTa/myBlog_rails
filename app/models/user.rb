class User < ActiveRecord::Base
  include Gravtastic
  
  has_many :articles
  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: true
  validates :email, presence: true, length: { minimum: 3, maximum: 100 }, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  has_secure_password
  gravtastic
end