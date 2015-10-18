class UploadsController < ApplicationController
  def index
  end

  def show
    @upload = Upload.find(params[:id])
    @upload.upload_requests.create(ip_address: remote_ip)
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
