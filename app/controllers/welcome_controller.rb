class WelcomeController < ApplicationController

  def index
    if current_user
      redirect_to results_path
    end
  end
  
  def authenticate
    client = auth.client
    client.redirect_uri = $facebook[:app_url]
    redirect_to client.authorization_uri(
      :scope => [:email,:friends_hometown,:friends_location,:hometown,:location]
    )
  end
  

end
