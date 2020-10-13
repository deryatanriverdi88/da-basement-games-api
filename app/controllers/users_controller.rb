class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def create
        user = User.create(user_params)
        if user.valid?
            render json: { token: encoded_token(user_payload(user)), current_user: user}
        else
            render json: { error: user.errors.full_messages}
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end
end
