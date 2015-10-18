class ChangeIpAddressColumn < ActiveRecord::Migration
  def change
    change_column :upload_requests, :ip_address, :string
  end
end
