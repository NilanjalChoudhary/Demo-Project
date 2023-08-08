class UserSerializer
  # include JSONAPI::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :name
end