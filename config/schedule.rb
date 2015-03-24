# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}
#
#
every :day, :at => "5: pm" do
  # rake "files:read_colaborations"            # leer archivos pdf de colaboraciones en el directorio /public
  # rake "files:read_events"                   # leer archivos pdf de eventos en el directorio /public
  # rake "files:read_historical"               # leer archivos pdf del archivo historico en directorio /public / read pdf files from public directory
  # rake "files:read_investigations"           # leer archivos pdf de casos en el directorio /public
  # rake "files:read_justices"                 # leer archivos pdf de justicias en el directorio /public
  # rake "files:read_offices"                  # leer archivos pdf de oficios en el directorio /public
end





# every :day, :at => '04:10 pm' do
#   rake "files:read_investigations"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
# Learn more: http://github.com/javan/whenever
