class HomeController < ApplicationController
  skip_authorization_check only: [:index]
  before_filter :authenticate_user!, except: [:index]

  def index
    respond_to do |format|
      format.html
    end
  end
end
