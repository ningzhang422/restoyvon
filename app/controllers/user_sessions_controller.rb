class UserSessionsController < Devise::SessionsController #ApplicationController
	skip_before_action :authenticate, :verify_authenticity_token,:verify_signed_out_user
  def create
    if user_signed_in?
	    render plain: "ok"
       #redirect_to(root_path)
    else
      error(:login_failed)
      redirect_to login_path
    end
  end

end
