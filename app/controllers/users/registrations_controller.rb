class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  def edit
    render layout: "application"
  end

  def sign_up_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:code,:nickname,:password,:password_confirmation) }
    super
  end

  def account_update_params
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:code,:nickname,:password,:current_password,:password_confirmation) }
    super
  end
end
