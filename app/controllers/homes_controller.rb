class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    render :index
  end
end
