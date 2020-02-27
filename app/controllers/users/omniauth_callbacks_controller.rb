# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) do |u|
          u.permit(:name, :email, :password, :password_confirmation, :birthday, :image)
        end
        devise_parameter_sanitizer.for(:sign_up) do |u|
          u.permit(:name, :email, :password, :password_confirmation, :birthday, :image, :current_password)
        end
    end
end
