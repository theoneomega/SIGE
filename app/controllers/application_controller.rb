class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
  def local_request?
    false
  end
  if Rails.env == "production" or Rails.env == "development" or Rails.env == "local"
    rescue_from Exception do |exception|#WORKS
      line_number = exception.backtrace.to_s.split(":in").first.gsub("[\"", "")
      flash[:error] = "Ha ocurrido un error mientras se procesaba su solicitud.  Para mayor infomacion contacte a su administrador de sistema."

      render welcome_index_path
      ErrorReport.create(:user => signed_in? ? current_user.username : "Guess User" , :controller_name => controller_name, :action_name => action_name, :description => exception.to_s, :referrer_url => request.referer, :original_path => request.env['ORIGINAL_FULLPATH'], :environment => Rails.env, :error_time => Time.now , :line_number => line_number, :backtrace => exception.backtrace)
    end
    rescue_from ActiveRecord::RecordNotFound do |exception|#WORKS
      line_number = exception.backtrace.to_s.split(":in").first.gsub("[\"", "")
      # flash[:error] = "Ha ocurrido un error mientras se procesaba su solicitud.  Para mayor infomacion contacte a su administrador de sistema."
      render "welcome/index"
      ErrorReport.create(:user => signed_in? ? current_user.username : "Guess User" , :controller_name => controller_name, :action_name => action_name, :description => exception.to_s, :referrer_url => request.referer, :original_path => request.env['ORIGINAL_FULLPATH'], :environment => Rails.env, :error_time => Time.now , :line_number => line_number, :backtrace => exception.backtrace)
    end


    #    rescue_from ActionController::UnknownController do |exception|
    #      flash[:error] = t(:something_wrong, :exeption => exception.to_s)
    #      render warnings_no_access_path
    #      ErrorReport.create(:user => signed_in? ? current_user.fullname : "Default User" , :controller_name => controller_name, :action_name => action_name, :description => exception.to_s, :referrer_url => request.referer, :original_path => request.env['ORIGINAL_FULLPATH'], :library_id => @current_library.id, :environment => Rails.env, :other => Time.now - 6.hours)
    #    end
    #    rescue_from ActionController::UnknownAction do |exception|
    #      flash[:error] = t(:something_wrong, :exeption => exception.to_s)
    #      render warnings_no_access_path
    #      ErrorReport.create(:user => signed_in? ? current_user.fullname : "Default User" , :controller_name => controller_name, :action_name => action_name, :description => exception.to_s, :referrer_url => request.referer, :original_path => request.env['ORIGINAL_FULLPATH'], :library_id => @current_library.id, :environment => Rails.env, :other => Time.now - 6.hours)
    #    end
    #    rescue_from AbstractController::ActionNotFound do |exception|
    #      flash[:error] = t(:something_wrong, :exeption => exception.to_s)
    #      render warnings_no_access_path
    #      ErrorReport.create(:user => signed_in? ? current_user.fullname : "Default User" , :controller_name => controller_name, :action_name => action_name, :description => exception.to_s, :referrer_url => request.referer, :original_path => request.env['ORIGINAL_FULLPATH'], :library_id => @current_library.id, :environment => Rails.env, :other => Time.now - 6.hours)
    #    end
  end
end
