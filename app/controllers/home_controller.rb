class HomeController < ApplicationController
  skip_authorization_check only: [:index]
  before_filter :authenticate_user!, except: [:index]

  def index
    if current_user
      redirect_to devices_path
    else
      respond_to do |format|
        format.html
      end
    end
  end
end
