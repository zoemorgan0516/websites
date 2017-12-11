class Admin::ClassesController < ApplicationController
  before_action :set_admin_class, only: [:show, :edit, :update, :destroy]

  # GET /admin/classes
  # GET /admin/classes.json
  def index
    @admin_classes = Admin::Class.all
  end

  # GET /admin/classes/1
  # GET /admin/classes/1.json
  def show
  end

  # GET /admin/classes/new
  def new
    @admin_class = Admin::Class.new
  end

  # GET /admin/classes/1/edit
  def edit
  end

  # POST /admin/classes
  # POST /admin/classes.json
  def create
    @admin_class = Admin::Class.new(admin_class_params)

    respond_to do |format|
      if @admin_class.save
        format.html { redirect_to @admin_class, notice: 'Class was successfully created.' }
        format.json { render :show, status: :created, location: @admin_class }
      else
        format.html { render :new }
        format.json { render json: @admin_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/classes/1
  # PATCH/PUT /admin/classes/1.json
  def update
    respond_to do |format|
      if @admin_class.update(admin_class_params)
        format.html { redirect_to @admin_class, notice: 'Class was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_class }
      else
        format.html { render :edit }
        format.json { render json: @admin_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/classes/1
  # DELETE /admin/classes/1.json
  def destroy
    @admin_class.destroy
    respond_to do |format|
      format.html { redirect_to admin_classes_url, notice: 'Class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_class
      @admin_class = Admin::Class.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_class_params
      params.require(:admin_class).permit(:Footer)
    end
end
