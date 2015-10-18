class SearchController < ApplicationController
  def find_nearby
    # find uploads that are within a range of 10km
    @uploads = Upload.near(remote_ip, 20)
    @markers = create_markers(@uploads.geocoded)
  end
end
