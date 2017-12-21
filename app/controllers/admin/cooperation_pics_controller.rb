class Admin::CooperationPicsController < ApplicationController
  before_action :set_admin_cooperation_pic, only: [:show, :edit, :update, :destroy]

  # GET /admin/cooperation_pics
  # GET /admin/cooperation_pics.json
  def index
    @admin_cooperation_pics = Admin::CooperationPic.all
  end

  # GET /admin/cooperation_pics/1
  # GET /admin/cooperation_pics/1.json
  def show
  end

  # GET /admin/cooperation_pics/new
  def new
    @admin_cooperation_pic = Admin::CooperationPic.new
  end

  # GET /admin/cooperation_pics/1/edit
  def edit
  end

  # POST /admin/cooperation_pics
  # POST /admin/cooperation_pics.json
  def create
    @admin_cooperation_pic = Admin::CooperationPic.new(admin_cooperation_pic_params)

    respond_to do |format|
      if @admin_cooperation_pic.save
        format.html { redirect_to @admin_cooperation_pic, notice: 'Cooperation pic was successfully created.' }
        format.json { render :show, status: :created, location: @admin_cooperation_pic }
      else
        format.html { render :new }
        format.json { render json: @admin_cooperation_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/cooperation_pics/1
  # PATCH/PUT /admin/cooperation_pics/1.json
  def update
    respond_to do |format|
      if @admin_cooperation_pic.update(admin_cooperation_pic_params)
        format.html { redirect_to @admin_cooperation_pic, notice: 'Cooperation pic was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_cooperation_pic }
      else
        format.html { render :edit }
        format.json { render json: @admin_cooperation_pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/cooperation_pics/1
  # DELETE /admin/cooperation_pics/1.json
  def destroy
    @admin_cooperation_pic.destroy
    respond_to do |format|
      format.html { redirect_to admin_cooperation_pics_url, notice: 'Cooperation pic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete
    @cooperation_pic = CooperationPic.find(params[:id])
    @cooperation_pic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_cooperation_pic
      @admin_cooperation_pic = Admin::CooperationPic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_cooperation_pic_params
      params.fetch(:admin_cooperation_pic, {})
    end
end
