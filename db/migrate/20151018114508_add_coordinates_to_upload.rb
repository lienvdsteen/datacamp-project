class AddCoordinatesToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :latitude, :float
    add_column :uploads, :longitude, :float
  end
end
