class RoutineSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :id
  has_many :tasks
end
