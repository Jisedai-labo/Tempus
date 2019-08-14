class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_up_path_for(resources)
        user_path(current_user)
    end

    def after_sign_in__path_for(resources)
        user_path(current_user)
    end

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name ,:email])
    end


end
