class TripSerializer < ActiveModel::Serializer
  attributes :id, :picture, :rating, :description, :price, :name, :country_id, :user_id
  belongs_to :user 
  belongs_to :country

end
