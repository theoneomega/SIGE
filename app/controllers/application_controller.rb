class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
#  before_filter :set_charset
#  def set_charset
#    @headers["Content-Type"] = "text/html; charset=utf-8"
#  end
end
