class ApplicationController < ActionController::API
    def user_payload(user)
        { user_id: user.id }
    end

    def encoded_token(payload)
        JWT.encode(payload, secret_key, "HS256")
    end

    def secret_key
        ENV["secret_key"]
    end

    def current_user
        token = request.headers["Authorization"]
        begin
            decoded_token = JWT.decode(token, secret_key, true, {algorithm: 'HS256'})
            return  User.find(decoded_token[0]["user_id"])
        rescue
            return nil
        end
    end
end
