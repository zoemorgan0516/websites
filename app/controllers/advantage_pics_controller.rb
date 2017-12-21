class AdvantagePicsController < ApplicationController
  before_action :set_advantage_pic, only: [:show, :edit, :update, :destroy]

  # GET /advantage_pics
  # GET /advantage_pics.json
  def index
    @advantage_pics = AdvantagePic.all
  end

  # GET /advantage_pics/1
  # GET /advantage_pics/1.json
  def show
  end

  # GET /advantage_pics/new
  def new
    @advantage_pic = AdvantagePic.new
  end

  # GET /advantage_pics/1/edit
  def edit
  end

  # POST /advantage_pics
  # POST /advantage_pics.json
  def create
    @advantage_pic = AdvantagePic.new(advantage_pic_params)

    respond_to do |format|
      if @advantage_pic.save
        format.html { redirect_to @advantage_pic, notice: 'Advantage pic was successfully created.' }
        format.json { render :show, status: :created, location: @advantage_pic }
      else
        format.html { render :new }
        format.json { render json: @advantage_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advantage_pics/1
  # PATCH/PUT /advantage_pics/1.json
  def update
    respond_to do |format|
      if @advantage_pic.update(advantage_pic_params)
        format.html { redirect_to @advantage_pic, notice: 'Advantage pic was successfully updated.' }
        format.json { render :show, status: :ok, location: @advantage_pic }
      else
        format.html { render :edit }
        format.json { render json: @advantage_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advantage_pics/1
  # DELETE /advantage_pics/1.json
  def destroy
    @advantage_pic.destroy
    respond_to do |format|
      format.html { redirect_to advantage_pics_url, notice: 'Advantage pic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advantage_pic
      @advantage_pic = AdvantagePic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advantage_pic_params
      params.fetch(:advantage_pic, {})
    end
end
