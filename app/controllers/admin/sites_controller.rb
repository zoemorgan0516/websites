class Admin::SitesController < ApplicationController
  before_action :authenticate_user!
  layout "admin"
  def index
    @sites = current_user.sites
  end
end
