class Upload < ActiveRecord::Base
  has_many :upload_requests

  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :image,
    content_type: /\Aimage\/.*\z/

  geocoded_by :ip_address
  after_validation :geocode
end
