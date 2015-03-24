namespace :greet do
  desc "Hola mundo 1"
  task :first => :environment do
    puts "2 Hello world at #{Time.now}"
  end

  desc "Hola mundo 2"
  task :second => :environment do
    puts " 1 Hello world at #{Time.now}"
  end
end