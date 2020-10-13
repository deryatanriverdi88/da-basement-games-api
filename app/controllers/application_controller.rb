class ApplicationController < ActionController::API
    def user_payload(user)
        { user_id: user.id }
    end
end
