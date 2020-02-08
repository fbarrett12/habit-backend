class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :content, :user_id, :routine_id
  belongs_to :user
  belongs_to :routine
end
