class UserSessionsController < Devise::SessionsController #ApplicationController
	skip_before_action :authenticate, :verify_authenticity_token,:verify_signed_out_user
  def create
    if user_signed_in?
	    render plain: "ok"
       #redirect_to(root_path)
    else
      #error(:login_failed)
      flash[:error] = "用户名或密码不正确，login ou mot de passe est incorrect!"
      redirect_to login_path
    end
  end

end
