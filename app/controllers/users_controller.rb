class UsersController < ApplicationController
  def show
    @name = 'Profile'
    render :show
  end
end
