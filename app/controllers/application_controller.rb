class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_in_path_for(resource)
        user_path(current_user)
    end

    protected

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name ,:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name ,:email])
    end

    def sign_in_required
        redirect_to new_user_session_path unless user_signed_in?
    end


end
