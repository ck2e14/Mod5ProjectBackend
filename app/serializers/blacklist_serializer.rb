class BlacklistSerializer < ActiveModel::Serializer
  attributes :id, :establishment_id, :user_id, :comment 
end
