class Blacklist < ApplicationRecord
   belongs_to :user
   belongs_to :establishment
   
   validates :establishment_id, uniqueness: true
end
