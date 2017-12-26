class SitesController < FrontBaseController

  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = @current_site
  end
  
end
