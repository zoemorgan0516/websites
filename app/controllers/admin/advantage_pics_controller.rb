class Admin::AdvantagePicsController < ApplicationController
  before_action :set_admin_advantage_pic, only: [:show, :edit, :update, :destroy]

  # GET /admin/advantage_pics
  # GET /admin/advantage_pics.json
  def index
    @admin_advantage_pics = Admin::AdvantagePic.all
  end

  # GET /admin/advantage_pics/1
  # GET /admin/advantage_pics/1.json
  def show
  end

  # GET /admin/advantage_pics/new
  def new
    @admin_advantage_pic = Admin::AdvantagePic.new
  end

  # GET /admin/advantage_pics/1/edit
  def edit
  end

  # POST /admin/advantage_pics
  # POST /admin/advantage_pics.json
  def create
    @admin_advantage_pic = Admin::AdvantagePic.new(admin_advantage_pic_params)

    respond_to do |format|
      if @admin_advantage_pic.save
        format.html { redirect_to @admin_advantage_pic, notice: 'Advantage pic was successfully created.' }
        format.json { render :show, status: :created, location: @admin_advantage_pic }
      else
        format.html { render :new }
        format.json { render json: @admin_advantage_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/advantage_pics/1
  # PATCH/PUT /admin/advantage_pics/1.json
  def update
    respond_to do |format|
      if @admin_advantage_pic.update(admin_advantage_pic_params)
        format.html { redirect_to @admin_advantage_pic, notice: 'Advantage pic was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_advantage_pic }
      else
        format.html { render :edit }
        format.json { render json: @admin_advantage_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/advantage_pics/1
  # DELETE /admin/advantage_pics/1.json
  def destroy
    @advantage_pic = AdvantagePic.find(params[:id])
    @advantage_pic.destroy
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_advantage_pic
      @advantage_pic = AdvantagePic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_advantage_pic_params
      params.fetch(:admin_advantage_pic, {})
    end
end
