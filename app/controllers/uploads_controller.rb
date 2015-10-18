class UploadsController < ApplicationController
  def index
  end

  def show
    @upload = Upload.find(params[:id])
    @upload.upload_requests.create(ip_address: remote_ip)
    @markers = Gmaps4rails.build_markers(@upload.upload_requests) do |upload_request, marker|
      marker.lat upload_request.latitude unless upload_request.latitude.nil?
      marker.lng upload_request.longitude unless upload_request.longitude.nil?
    end
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
