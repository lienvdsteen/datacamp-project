class CreateUploadRequests < ActiveRecord::Migration
  def change
    create_table :upload_requests do |t|
      t.references :upload, index: true, foreign_key: true
      t.inet :ip_address

      t.timestamps null: false
    end
  end
end
