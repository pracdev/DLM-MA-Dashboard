class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    gravity_path    
  end
end
