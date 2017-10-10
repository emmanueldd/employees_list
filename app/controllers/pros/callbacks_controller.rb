class Pros::CallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @pro = Pro.find_for_google_oauth2(request.env["omniauth.auth"])
    if @pro
      sign_in @pro
      redirect_to root_path
    else
      redirect_to new_pro_session_path, notice: 'Access Denied.'
    end
  end
end
