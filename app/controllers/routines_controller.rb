class RoutinesController < ApplicationController
    def create
        @routine = Routine.create(routine_params)  
        render json: RoutineSerializer.new(@routine).serialized_json
    end

    private

    def routine_params
        params.permit(:title, :description)
    end
end
