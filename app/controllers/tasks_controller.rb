class TasksController < ApplicationController
    def index
        @tasks = Task.all
        render json: TaskSerializer.new(@tasks).serialized_json
    end
    def create
        byebug
        @task = Task.create(task_params)  
        render json: TaskSerializer.new(@task).serialized_json
    end


    private

    def task_params
        params.permit(:content, :user_id, :routine_id)
    end
end
