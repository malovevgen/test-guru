class BadgesUsersController < ApplicationController

  before_action :authenticate_user!
  #before_action :set_badges_users

  def index
    @badges_users = BadgesUser.all
  end


end
