class AdvantagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  layout "admin"

  def index
    @site = current_user.site
    @advantages = @site.advantages.all
  end
end
