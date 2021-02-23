class ApplicationController < ActionController::Base
   before_action :basic_auth
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :surname, :name, :surname_kana, :name_kana, :birthday])
   end

  private

   def basic_auth
     authenticate_or_request_with_http_basic do |username, password|
     username == 'user' && password == '0000'
   end
  end
end
 