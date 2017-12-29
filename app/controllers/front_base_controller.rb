class FrontBaseController < ApplicationController
  layout 'template'
  before_action :set_current_site

  private

  def set_current_site
    logger.debug request.host
    if Rails.env.development?
      if current_user
        @current_site = current_user.site
      else
        @current_site = Site.last
      end
      #此处代码本应是：@current_site = Site.first
      #但是，由于Site.first无图片每次都报错，为了本地测试效果查看，此处写为@current_user，因为我们不可能只有一个site站点。
    else
      @current_site = Site.find_by(domain: request.host)
    end
  end
end
