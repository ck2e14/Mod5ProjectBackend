class EstablishmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :type_of, :location
  has_many :blacklists
  has_many :users, through: :blacklists 
  # **** IS THIS A NECESSARY ASSOCIATION? ****
  has_many :reviews
end
