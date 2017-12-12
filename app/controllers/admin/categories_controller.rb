class Admin::CategoriesController < ApplicationController
  class Admin::SitesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    before_action :set_site, only: [:edit, :update]
    layout "admin"
end
