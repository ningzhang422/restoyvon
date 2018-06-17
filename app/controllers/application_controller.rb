class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate

private
  def authenticate
        unless current_user
                redirect_to(login_path)
        end
  end
end
