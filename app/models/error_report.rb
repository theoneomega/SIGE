class ErrorReport < ActiveRecord::Base
  attr_accessible :action_name, :backtrace, :controller_name,
                  :description, :environment, :error_time, :line_number,
                  :original_path, :referrer_url, :user
  self.per_page = 10

end
