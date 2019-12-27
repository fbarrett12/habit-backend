class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :name
  has_many :tasks
end
