namespace :backup do
  desc "backup data"
  task :models => :environment do

    # @models = []
    # @models << "Area"
    # @models << "User"
    # @models << "Analyst"

    @models = Dir['app/models/*.rb'].map { |f| File.basename(f, '.*').camelize.constantize.name }
    @models -= %w{Activity Search IphPerson IphIphDrug Ability CriminalWeapon IphCrime Statistic Unit IphObject IphIphPerson IphIphVehicle IphIphObject Assignment IphDrug Iph IphVehicle ClicksActivity IphWeapon CriminalGroup CriminalVehicle IphImage ColaborationArea EventsCollection}
    file = File.open("db/seeds.rb", "w")

    @models.each do |model|

      @columns = model.constantize.column_names
      rows = model.constantize.all
      file.write("#{model}.create!([")
      rows.each do |row|

        @columns.each do |column|
          if @columns.first == column
            if row[column].is_a? Integer or row[column].is_a? TrueClass or row[column].is_a? FalseClass
              file.write("{:#{column} => #{row[column]}, ")
            elsif row[column].is_a? Time or row[column].is_a? Bignum
              # puts "#{row[column]} es tipo dato"
              file.write("{:#{column} => '#{row[column]}',")
            else
              file.write("{:#{column} => '#{row[column].gsub("'", "\'") if row[column]}', ")
            end
          elsif @columns.last == column
            if row[column].is_a? Integer or row[column].is_a? TrueClass or row[column].is_a? FalseClass
              file.write(":#{column} => #{row[column]} },\n")
            elsif row[column].is_a? Time or row[column].is_a? Bignum
              # puts "#{row[column]} es tipo dato"
              file.write(":#{column} => '#{row[column]}'},\n")
            else
              file.write(":#{column} => '#{row[column].gsub("'", "\'") if row[column] }' },\n ")
            end
          else
            if row[column].is_a? Integer or row[column].is_a? TrueClass or row[column].is_a? FalseClass
              file.write(":#{column} => #{row[column]},")
            elsif row[column].is_a? Time or row[column].is_a? Bignum
              # puts "#{row[column]} es tipo dato"
              file.write(":#{column} => '#{row[column]}',")
            else
              file.write(":#{column} => '#{row[column].gsub("'", "\'") if row[column]}',")
            end
          end
        end
      end
      file.write("]) \n")
    end
    file.close
  end
end