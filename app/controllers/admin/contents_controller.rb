class Admin::ContentsController < BaseController
  before_action :set_content, only: [:edit, :update, :destroy]

  def index
    @contents_class = ContentsClass.find(params[:contents_class_id])
    @contents = @contents_class.contents.all.page params[:page]
  end


  def edit
  end

  def new
    @contents_class = ContentsClass.find(params[:contents_class_id])
    @content = @contents_class.contents.new
    @photo = @content.photos.build
  end

  def create
    @contents_class = ContentsClass.find(params[:contents_class_id])
    @content = @contents_class.contents.new(content_params)
    @content.save
    params[:photos]['avatar'].each do |i|
      @photo = @content.photos.create!(:avatar => i)
    end
    redirect_to admin_contents_path(contents_class_id: @content.contents_class_id)
  end

  def update
    @content = @contents_class.contents.find(params[:id])
    @content.update(content_params)
    if not params[:photos].blank?
       params[:photos]['avatar'].each do |i|
         @photo = @content.photos.create!(:avatar => i)
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
    @contents_class = ContentsClass.find(params[:contents_class_id])
    @content = @contents_class.contents.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:title, :word, photos_attributes: [:avatar])
  end
end
