class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :data, :created_at, :updated_at, :token_updated_at, :token_created_at
  def data
    object.json_data
  end
  
  def token_updated_at
    object.token_updated_at.to_s
  end
  
  def token_created_at
    object.token_created_at.to_s
  end
end
