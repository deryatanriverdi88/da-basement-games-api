class ApplicationController < ActionController::API
    def user_payload(user)
        { user_id: user.id }
    end

    def encoded_token(payload)
        JWT.encode(payload, secret_key, "HS256")
    end
end
