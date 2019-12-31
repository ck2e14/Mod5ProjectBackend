class Establishment < ApplicationRecord
   has_many :blacklists
   has_many :reviews
   has_many :users, through: :reviews
   validates :name, uniqueness: { case_sensitive: false }


end
