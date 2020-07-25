class Establishment < ApplicationRecord
   has_many :blacklists
   has_many :reviews
   has_many :users, through: :reviews
end
   # probably should put in has_many :users through: :blacklists too
   # don't think i've needed to ask what Users are associated with a given establishment but I should put this in since the many-to-many relationship is incompletely defined otherwise: Estabs can be blacklisted by many users, Users can blacklist many estabs. 

   #  USER        <--->        BLACKLISTINGS    <---->    ESTABLISHMENT
   #     has_many(estabs)        through                   has_many(users)
   #                         (belongs to both) 


   # validates :name, uniqueness: { case_sensitive: false }



