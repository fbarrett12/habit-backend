class UsersController < ApplicationController
    def create
        @user = User.create(user_params)
        if @user.valid? 
            user = @user
            token = JWT.encode({user_id: user.id}, secret, 'HS256')
            render json: {user: user, token: token}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    private

    def user_params
        params.permit(:username, :name, :password)
    end

    def secret
        ENV["JWT_SECRET_KEY"]
    end
    
end
