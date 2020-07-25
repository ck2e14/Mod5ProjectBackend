class User < ApplicationRecord
   has_secure_password
   validates :username, uniqueness: { case_sensitive: false }
   validates :username, presence: true
   validates :password, presence: true 
   validates :password, :length => {:within => 6..15}
   # validates :username, :length => {:within => 5..15}

   
   has_many :reviews
   # has_many :establishments, through: :reviews ***IS THIS A NECESSARY ASSOCIATION?****
   has_many :blacklists

end
