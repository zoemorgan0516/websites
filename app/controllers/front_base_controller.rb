class FrontBaseController < ApplicationController
  layout 'application'
  before_action :set_current_site

  private

  def set_current_site
    logger.debug request.host
    if Rails.env.development?
      @current_site = Site.first
    else
      @current_site = Site.find_by(domain: request.host)
    end
  end
end
