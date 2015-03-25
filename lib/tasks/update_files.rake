namespace :files do
  desc "actualizar archivos pdfs"
  task :update_files => :environment do
    puts "inicio de tarea a las #{Time.now}"
    puts "inicio borrado de registros anteriores a las #{Time.now}"
    row = HistoricalArchive.all
    row.each do |r|
      r.destroy
    end
    puts "termino de borrado de registros anteriores a las #{Time.now}"
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
    total = Dir.glob("#{Rails.root}/public/respaldos/eventos/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos pdf en eventos por registrar a la fecha #{Time.now} \n"
    Dir.glob("#{Rails.root}/public/respaldos/eventos/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}",
                                 :content => File.read(filepath.gsub('.pdf', '.txt')),
                                 :location => "EVENTOS")
      end
    end
    total = Dir.glob("#{Rails.root}/public/respaldos/oficios/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos pdf de oficios por registrar a la fecha: #{Time.now} \n"
    Dir.glob("#{Rails.root}/public/respaldos/oficios/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}",
                                 :content => File.read(filepath.gsub('.pdf', '.txt')),
                                 :location => "OFICIOS")
      end
    end
    total = Dir.glob("#{Rails.root}/public/respaldos/colaboraciones/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos de colaboraciones por registrar a la fecha: #{Time.now}\n"

    Dir.glob("#{Rails.root}/public/respaldos/colaboraciones/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}",
                                 :content => File.read(filepath.gsub('.pdf', '.txt')),
                                 :location => "COLABORACIONES")
      end
    end
    total = Dir.glob("#{Rails.root}/public/respaldos/JusticiaNet/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos de justicias por registrar a la fecha: #{Time.now}\n"
    Dir.glob("#{Rails.root}/public/respaldos/JusticiaNet/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}", :content => File.read(filepath.gsub('.pdf', '.txt')),
                                 :location => "SOLICITUDES ELECTRONICAS")
      end
    end
    total = Dir.glob("#{Rails.root}/public/respaldos/casos/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos de casos por registrar a la fecha: #{Time.now}"
    Dir.glob("#{Rails.root}/public/respaldos/casos/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}", :content => File.read(filepath.gsub('.pdf', '.txt')),
                                 :location => "CASOS")
      end
    end
    puts "inicio borrando archivos txt a las #{Time.now}...\n"

    Dir.glob("#{Rails.root}/public/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.txt",File::FNM_CASEFOLD) do |filepath|
      `rm -f #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
    end

    puts "fin de la tarea a las #{Time.now}"
  end
end