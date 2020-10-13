class SessionController < ApplicationController
    def login
        user = User.find_by(email: params[:email])
        if user
            password = params[:password_digest]
            is_authenticated = user.authenticate(password)
            if is_authenticated
                render json: { token: encoded_token(user_payload(user)), current_user: user}
            else
                render json: {error: "INCORRECT INFIORMATION, PLEASE TRY AGAIN"}
            end
        else
            render json: {error: errors.full_messages}
        end
    end
end
