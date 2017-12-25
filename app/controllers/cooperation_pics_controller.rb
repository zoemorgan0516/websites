class CooperationPicsController < ApplicationController
  before_action :set_cooperation_pic, only: [:show, :edit, :update, :destroy]

  # GET /cooperation_pics
  # GET /cooperation_pics.json
  def index
    @cooperation_pics = CooperationPic.all
  end

  # GET /cooperation_pics/1
  # GET /cooperation_pics/1.json
  def show
  end

  # GET /cooperation_pics/new
  def new
    @cooperation_pic = CooperationPic.new
  end

  # GET /cooperation_pics/1/edit
  def edit
  end

  # POST /cooperation_pics
  # POST /cooperation_pics.json
  def create
    @cooperation_pic = CooperationPic.new(cooperation_pic_params)

    respond_to do |format|
      if @cooperation_pic.save
        format.html { redirect_to @cooperation_pic, notice: 'Cooperation pic was successfully created.' }
        format.json { render :show, status: :created, location: @cooperation_pic }
      else
        format.html { render :new }
        format.json { render json: @cooperation_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cooperation_pics/1
  # PATCH/PUT /cooperation_pics/1.json
  def update
    respond_to do |format|
      if @cooperation_pic.update(cooperation_pic_params)
        format.html { redirect_to @cooperation_pic, notice: 'Cooperation pic was successfully updated.' }
        format.json { render :show, status: :ok, location: @cooperation_pic }
      else
        format.html { render :edit }
        format.json { render json: @cooperation_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cooperation_pics/1
  # DELETE /cooperation_pics/1.json
  def destroy
    @cooperation_pic.destroy
    respond_to do |format|
      format.html { redirect_to cooperation_pics_url, notice: 'Cooperation pic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cooperation_pic
      @cooperation_pic = CooperationPic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cooperation_pic_params
      params.fetch(:cooperation_pic, {})
    end
end
