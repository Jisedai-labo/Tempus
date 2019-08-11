class ApplicationController < ActionController::Base

    def after_sign_up_path_for(resources)
        user_path(current_user)
    end

    def after_sign_in__path_for(resources)
        user_path(current_user)
    end

end
