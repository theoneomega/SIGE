namespace :files do
  desc "actualizar archivos pdfs"
  task :read_historical => :environment do

    row = HistoricalArchive.all
    row.each do |r|
      r.destroy
    end
    total = Dir.glob("#{Rails.root}/public/archivo/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos historicos por registrar a la fecha: #{Time.now} \n"
    Dir.glob("#{Rails.root}/public/archivo/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      if File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}",
                                 :content => File.read(filepath.gsub('.pdf', '.txt')),
                                 :location => 'ARCHIVO MUERTO')
      end
    end
    puts "borrando archivos txt archivo muerto...\n"

    Dir.glob("#{Rails.root}/public/archivo/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.txt",File::FNM_CASEFOLD) do |filepath|
      `rm -f #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
    end
  end

  desc "leer archivos pdf de eventos en el directorio /public"
  task :read_events => :environment do
    total = Dir.glob("#{Rails.root}/public/respaldos/eventos/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos pdf en eventos por registrar a la fecha #{Time.now} \n"
    row = HistoricalArchive.where(:location => "EVENTOS")
    row.each do |r|
      r.destroy
    end
    Dir.glob("#{Rails.root}/public/respaldos/eventos/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}",
                                 :content => File.read(filepath.gsub('.pdf', '.txt')),
                                 :location => "EVENTOS")
      end
    end
    puts "borrando archivos txt de eventos...\n"

    Dir.glob("#{Rails.root}/public/respaldos/eventos/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.txt",File::FNM_CASEFOLD) do |filepath|
      `rm -f #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
    end
  end

  desc "leer archivos pdf de oficios en el directorio /public"
  task :read_offices => :environment do
    total = Dir.glob("#{Rails.root}/public/respaldos/oficios/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos pdf de oficios por registrar a la fecha: #{Time.now} \n"
    row = HistoricalArchive.where(:location => "OFICIOS")
    row.each do |r|
      r.destroy
    end
    Dir.glob("#{Rails.root}/public/respaldos/oficios/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}",
                                 :content => File.read(filepath.gsub('.pdf', '.txt')),
                                 :location => "OFICIOS")
      end
    end
    puts "borrando archivos txt de oficios...\n"

    Dir.glob("#{Rails.root}/public/respaldos/oficios/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.txt",File::FNM_CASEFOLD) do |filepath|
      `rm -f #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
    end
  end

  desc "leer archivos pdf de colaboraciones en el directorio /public"
  task :read_colaborations => :environment do
    total = Dir.glob("#{Rails.root}/public/respaldos/colaboraciones/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos de colaboraciones por registrar a la fecha: #{Time.now}\n"
    row = HistoricalArchive.where(:location => "COLABORACIONES")
    row.each do |r|
      r.destroy
    end
    Dir.glob("#{Rails.root}/public/respaldos/colaboraciones/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}",
                                 :content => File.read(filepath.gsub('.pdf', '.txt')),
                                 :location => "COLABORACIONES")
      end
    end
    puts "borrando archivos txt de colaboraciones...\n"

    Dir.glob("#{Rails.root}/public/respaldos/colaboraciones/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.txt",File::FNM_CASEFOLD) do |filepath|
      `rm -f #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
    end
  end

  desc "leer archivos pdf de justicias en el directorio /public"
  task :read_justices => :environment do
    total = Dir.glob("#{Rails.root}/public/respaldos/JusticiaNet/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos de justicias por registrar a la fecha: #{Time.now}\n"
    row = HistoricalArchive.where(:location => "SOLICITUDES ELECTRONICAS")
    row.each do |r|
      r.destroy
    end
    Dir.glob("#{Rails.root}/public/respaldos/JusticiaNet/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}", :content => File.read(filepath.gsub('.pdf', '.txt')),
                                 :location => "SOLICITUDES ELECTRONICAS")
      end
    end
    puts "borrando archivos txt de justicias...\n"

    Dir.glob("#{Rails.root}/public/respaldos/JusticiaNet/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.txt",File::FNM_CASEFOLD) do |filepath|
      `rm -f #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
    end
  end

  desc "leer archivos pdf de casos en el directorio /public"
  task :read_investigations => :environment do
    total = Dir.glob("#{Rails.root}/public/respaldos/casos/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos de casos por registrar\n"
    row = HistoricalArchive.where(:location => "CASOS")
    row.each do |r|
      r.destroy
    end

    Dir.glob("#{Rails.root}/public/respaldos/casos/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}", :content => File.read(filepath.gsub('.pdf', '.txt')),
                                 :location => "CASOS")
      end
    end
    puts "borrando archivos txt de casos...\n"

    Dir.glob("#{Rails.root}/public/respaldos/casos/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.txt",File::FNM_CASEFOLD) do |filepath|
      `rm -f #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
    end
  end
end