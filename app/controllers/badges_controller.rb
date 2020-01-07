class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = Badge.all
    # render plain: 'All badges'
    # render html: '<h1>All badges</h1>'.html_safe
    # render json: { badges: Badge.all }
    # render inline: '<p>My favorite languge is: <%= %[ybuR].reverse! %> </p>'
    # render file: 'badges/all_level', layout: false
  end
end
