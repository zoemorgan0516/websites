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
    @photo = @cooperation.photos.build
  end

  def edit
  end

  def create
    @site = current_user.site
    @content = @site.contents.new(content_params)
    @content.save
      params[:photos]['avatar'].each do |i|
        @photo = @content.photos.create!(:avatar => i)
      end
    redirect_to admin_contents_path(@site)
  end

  def update
    if @content.update(params.require(:content).permit!)
       if not params[:content].blank?
         params[:photos]['avatar'].each do |i|
           @photo = @content.photos.create!(:avatar => i)
         end
       end
     end
    redirect_to admin_contents_path(@site)
  end

  def destroy
    @content.destroy
    redirect_to admin_contents_path(@site)
  end

  private

  def set_content
    @site = current_user.site
    @content = @site.contents.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:word, photos_attributes: [:id, :cooperation_id,:avatar])
  end
end
