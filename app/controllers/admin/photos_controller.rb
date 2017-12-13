class Admin::PhotosController < ApplicationController
  def delete
    @photo = Photo.find(params[:id])
    @photo.destroy
  end
end
