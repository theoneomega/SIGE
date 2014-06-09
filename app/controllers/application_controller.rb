class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
#  before_filter :set_charset
#  def set_charset
#    @headers["Content-Type"] = "text/html; charset=utf-8"
#  end
end
