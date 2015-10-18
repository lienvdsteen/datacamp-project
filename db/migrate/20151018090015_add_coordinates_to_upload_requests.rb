class AddCoordinatesToUploadRequests < ActiveRecord::Migration
  def change
    add_column :upload_requests, :latitude, :float
    add_column :upload_requests, :longitude, :float
  end
end
