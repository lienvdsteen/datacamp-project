class UploadsController < ApplicationController
  def index
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      render :show
    else
      render :new
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:image)
  end
end
