class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def show
    @upload = Upload.includes(:upload_requests).find(params[:id])
    render_404 if @upload.nil?
    @upload.upload_requests.create(ip_address: remote_ip)
    @markers = create_markers(@upload.upload_requests.geocoded)
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    @upload.ip_address = remote_ip
    if @upload.save
      render :show
    else
      render :new
    end
  end

  def by_filename
    @upload = Upload.find_by(image_file_name: "#{params[:filename]}.#{params[:format]}")
    redirect_to upload_path(@upload)
  end

  private

  def upload_params
    params.require(:upload).permit(:image)
  end

  def file_name
    "#{params[:filename]}.#{params[:format]}"
  end
end
