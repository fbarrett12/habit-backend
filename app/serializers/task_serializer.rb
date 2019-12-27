class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :content
  belongs_to :user
  belongs_to :routine
end
