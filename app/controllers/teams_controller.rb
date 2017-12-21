class TeamsController < ApplicationController
  def index
    @teams = (@current_user.profile_owner).teams
  end
end
