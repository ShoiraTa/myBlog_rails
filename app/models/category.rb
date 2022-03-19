class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 10, minimum: 3}
  
  
end