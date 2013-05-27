class WelcomeController < ApplicationController

  def index
    if current_user
      redirect_to results_path
    end
  end

end
