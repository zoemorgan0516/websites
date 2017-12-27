class FootersController < ApplicationController
  before_action :set_footer, only: [:show, :edit, :update, :destroy]

  def show
  end


  private
    def set_footer
      @footer = Footer.find(params[:id])
    end

end
