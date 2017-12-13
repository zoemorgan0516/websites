class Admin::ContentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_content, only: [:edit, :update]
  layout "admin"

  def index
    @site = current_user.site
    @contents = @site.contents
  end

  def new
    @content = Content.new
  end

  def edit
  end

  def create
    @site = current_user.site
    @content = @site.contents.new(content_params)
    @content.save
    redirect_to admin_contents_path(@site)
  end

  def update
    @content.update(content_params)
    redirect_to admin_contents_path(@site)
  end

  private

  def set_content
    @site = current_user.site
    @content = @site.contents.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:word, {images: []})
  end
end
