class CountrySerializer < ActiveModel::Serializer
  attributes :id, :name, :region, :subregion, :currency
  has_many :trips
  has_many :users, through: :trips
end
