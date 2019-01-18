class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :location, :profile_picture
  has_many :trips
  has_many :countries, through: :trips
end
