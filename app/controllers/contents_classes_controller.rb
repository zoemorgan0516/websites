class ContentsClassesController < ApplicationController
  before_action :set_contents_class, only: [:show, :edit, :update, :destroy]

  # GET /contents_classes
  # GET /contents_classes.json
  def index
    @contents_classes = ContentsClass.all
  end

  # GET /contents_classes/1
  # GET /contents_classes/1.json
  def show
  end

  # GET /contents_classes/new
  def new
    @contents_class = ContentsClass.new
  end

  # GET /contents_classes/1/edit
  def edit
  end

  # POST /contents_classes
  # POST /contents_classes.json
  def create
    @contents_class = ContentsClass.new(contents_class_params)

    respond_to do |format|
      if @contents_class.save
        format.html { redirect_to @contents_class, notice: 'Contents class was successfully created.' }
        format.json { render :show, status: :created, location: @contents_class }
      else
        format.html { render :new }
        format.json { render json: @contents_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents_classes/1
  # PATCH/PUT /contents_classes/1.json
  def update
    respond_to do |format|
      if @contents_class.update(contents_class_params)
        format.html { redirect_to @contents_class, notice: 'Contents class was successfully updated.' }
        format.json { render :show, status: :ok, location: @contents_class }
      else
        format.html { render :edit }
        format.json { render json: @contents_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents_classes/1
  # DELETE /contents_classes/1.json
  def destroy
    @contents_class.destroy
    respond_to do |format|
      format.html { redirect_to contents_classes_url, notice: 'Contents class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contents_class
      @contents_class = ContentsClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contents_class_params
      params.fetch(:contents_class, {})
    end
end
