class UploadRequest < ActiveRecord::Base
  belongs_to :upload

  geocoded_by :ip_address
  after_validation :geocode
end
