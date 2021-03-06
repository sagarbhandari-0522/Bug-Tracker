# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters,
                if: :devise_controller?
  def after_sign_in_path_for(*)
    dashboards_path(resource)
  end

  # def after_sign_out_path_for(_resource)
  #   new_user_session_path
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name profile_picture role_ids])
  end
end
