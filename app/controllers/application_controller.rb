class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


    rescue_from Exception,                      with: :render_500
    rescue_from ActiveRecord::RecordNotFound,   with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
 
  def routing_error
    raise ActionController::RoutingError, params[:path]
  end
 
  private
 
  def render_404
    render 'errors/404', status: :not_found
  end
 
  def render_500
    render 'errors/500', status: :internal_server_error
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction])
  end

  def after_sign_in_path_for(resource)
    case resource
    when User
      posts_path
    when AdminUser
      # AdminUser（管理ユーザ）がログインしたときの処理
      stored_location_for(resource) ||
       if resource.is_a?(AdminUser)
         posts_path
       else
         super
       end
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
