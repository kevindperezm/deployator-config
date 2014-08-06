class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    data = request.env["omniauth.auth"].info
    if data.email =~ /@crowdint\.com$/
        @user = User.find_or_create_for_google_oauth2(data)
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
    else
        flash[:notice] = 'You need to use a Crowdint account to sign in.', kind: 'Google'
        redirect_to root_path
    end
  end
end
