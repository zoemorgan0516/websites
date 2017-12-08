class Admin::SitesController < ApplicationController
  before_action :authenticate_user!
  layout "admin"
end
