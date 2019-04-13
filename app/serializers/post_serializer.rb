class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :content, :assigned_to
  belongs_to :user
end
