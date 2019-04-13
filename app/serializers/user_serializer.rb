class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :name, :gender, :role

  has_many :posts
end
