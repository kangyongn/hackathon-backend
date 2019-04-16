class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :gender, :role
  has_many :posts
end
