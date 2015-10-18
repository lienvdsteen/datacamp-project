class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def remote_ip
    if request.remote_ip == '127.0.0.1' || request.remote_ip == '::1'
      # Hard coded remote address so we can test it local
      '78.22.187.80'
    else
      request.remote_ip
    end
  end

  def create_markers(resource)
    markers = Gmaps4rails.build_markers(resource.geocoded) do |res, marker|
      marker.lat res.latitude unless res.latitude.nil?
      marker.lng res.longitude unless res.longitude.nil?
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
