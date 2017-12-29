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
      #此处代码本应是：@current_site = Site.last
      #但是，由于为了本地测试效果查看，此处写为@current_user，因为我们不可能只有一个site站点。
      #又因为如果仅仅写成@current_site = current_user.site，每次退出都报错，因为退出以后找不到currentuser。
      #所以应该做一个判断，既不报错，又可以看到每个站点测试效果。
    else
      @current_site = Site.find_by(domain: request.host)
    end
  end
end
