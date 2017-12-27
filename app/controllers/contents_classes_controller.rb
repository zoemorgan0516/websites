class ContentsClassesController < FrontBaseController
  before_action :set_contents_class, only: [:show]

  def show
  end


  private
    def set_contents_class
      @contents_class = ContentsClass.find(params[:id])
    end

end
