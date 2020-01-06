class AuthController < ApplicationController
    def login
        @user = User.find_by(username: login_params[:username])
                if @user && @user.authenticate(login_params[:password])
                    render json: tokenForAccount(UserSerializer.new(@user).serializable_hash) #{user: @user, token: token}
                else
                    render json: {errors: @user.errors.full_messages}
                end
    end

    def persist
        if request.headers['Authorization']
            # encoded_token = request.headers['Authorization'].split(' ')[1]
            # token = JWT.decode(encoded_token, secret)
            user_id = getIdFromToken
            @user = User.find(user_id)
            render json: tokenForAccount(@user)
        end
    end

    private

    def login_params
        params.require(:auth).permit(:username, :password)
    end
end
