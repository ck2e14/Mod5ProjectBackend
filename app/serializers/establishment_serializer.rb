class EstablishmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :type_of, :location, :latitude, :longitude, :localAuth, :postcode, :ratingValue, :ratingDate
  has_many :blacklists
  has_many :users, through: :blacklists 
  has_many :reviews
end
