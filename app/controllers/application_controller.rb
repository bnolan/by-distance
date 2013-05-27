class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def auth
    FbGraph::Auth.new($facebook[:id], $facebook[:secret])
  end

  def current_user
    @current_user ||=
      if params[:signed_request] and credentials = auth.from_signed_request(params[:signed_request]) and credentials.authorized?
        user = User.find_or_create_by_uid(credentials.data['user_id'])
        user.query!(credentials.access_token.to_s)
        session[:user_id] = user.id
        user
      elsif session[:user_id]
        User.find(session[:user_id])
      else
        nil
      end
  end
  helper_method :current_user
  
end
