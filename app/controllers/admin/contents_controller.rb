class Admin::ContentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_content, only: [:edit, :update]
  layout "admin"

  def index
    @contents = Content.where(contents_class_id: params[:contents_class_id]).page params[:page]
  end


  def edit
  end

  def create
    @site = current_user.site
    @contents_class = @site.contents_classes.find(params[:contents_class_id])
    @content = @contents_class.contents.new(content_params)
    @photo = @content.photos.build
    @content.save
    redirect_to admin_contents_path(contents_class_id: @content.contents_class_id)
      params[:photos]['avatar'].each do |i|
        @photo = @content.photos.create!(:avatar => i)
      end
  end

  def update
    @site = current_user.site
    @contents_class = @site.contents_classes.find(params[:contents_class_id])
    @content = @contents_class.contents.find(params[:id])
    if @content.update(content_params)
       if not params[:photos].blank?
         params[:photos]['avatar'].each do |i|
           @photo = @content.photos.create!(:avatar => i)
         end
       end
    end
    redirect_to admin_contents_path(contents_class_id: @content.contents_class_id)
  end

  def destroy
    @content.destroy
    redirect_to admin_contents_path(contents_class_id: @content.contents_class_id)
  end

  private

  def set_content
    @site = current_user.site
    @contents_class = @site.contents_classes.find(params[:contents_class_id])
    @content = @contents_class.contents.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:title, :word, photos_attributes: [:avatar])
  end
end
