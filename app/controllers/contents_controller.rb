class ContentsController < FrontBaseController
  before_action :set_content, only: [:show, :edit, :update, :destroy]


  def index
    @contents = Content.where(contents_class_id: params[:contents_class_id]).page params[:page]
  end

  def show
  end

  private

    def set_content
      @content = Content.find(params[:id])
    end

end
