namespace :files do
  desc "read pdf files from public directory"
  task :read_historical => :environment do
    total = Dir.glob("#{Rails.root}/public/archivo/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos por registrar\n"
    num = 0
    num1 = 0
    Dir.glob("#{Rails.root}/public/archivo/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      puts "#{num+=1} archivos convertidos\n"
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}", :content => File.read(filepath.gsub('.pdf', '.txt')),
                                 :location => 'ARCHIVO MUERTO')
        puts "#{num1+=1} archivos registrados\n"
      end
    end
    puts "borrando archivos...\n"

    Dir.glob("#{Rails.root}/public/archivo/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.txt",File::FNM_CASEFOLD) do |filepath|
      `rm -f #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
    end
  end
  task :read_events => :environment do
    total = Dir.glob("#{Rails.root}/public/respaldos/eventos/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos por registrar\n"
    num = 0
    num1 = 0
    Dir.glob("#{Rails.root}/public/respaldos/eventos/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      puts "#{num+=1} archivos convertidos\n"
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}", :content => File.read(filepath.gsub('.pdf', '.txt')),
        :location => "EVENTOS")
        puts "#{num1+=1} archivos registrados\n"
      end
    end
    puts "borrando archivos...\n"

    Dir.glob("#{Rails.root}/public/respaldos/eventos/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.txt",File::FNM_CASEFOLD) do |filepath|
      `rm -f #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
    end
  end

  task :read_offices => :environment do
    total = Dir.glob("#{Rails.root}/public/respaldos/oficios/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos por registrar\n"
    num = 0
    num1 = 0
    Dir.glob("#{Rails.root}/public/respaldos/oficios/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      puts "#{num+=1} archivos convertidos\n"
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}", :content => File.read(filepath.gsub('.pdf', '.txt')),
        :location => "OFICIOS")
        puts "#{num1+=1} archivos registrados\n"
      end
    end
    puts "borrando archivos...\n"

    Dir.glob("#{Rails.root}/public/respaldos/oficios/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.txt",File::FNM_CASEFOLD) do |filepath|
      `rm -f #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
    end
  end

  task :read_colaborations => :environment do
    total = Dir.glob("#{Rails.root}/public/respaldos/colaboraciones/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos por registrar\n"
    num = 0
    num1 = 0
    Dir.glob("#{Rails.root}/public/respaldos/colaboraciones/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      puts "#{num+=1} archivos convertidos\n"
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}", :content => File.read(filepath.gsub('.pdf', '.txt')),
        :location => "COLABORACIONES")
        puts "#{num1+=1} archivos registrados\n"
      end
    end
    puts "borrando archivos...\n"

    Dir.glob("#{Rails.root}/public/respaldos/colaboraciones/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.txt",File::FNM_CASEFOLD) do |filepath|
      `rm -f #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
    end
  end

  task :read_justices => :environment do
    total = Dir.glob("#{Rails.root}/public/respaldos/JusticiaNet/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD).count
    puts "hay #{total} archivos por registrar\n"
    num = 0
    num1 = 0
    Dir.glob("#{Rails.root}/public/respaldos/JusticiaNet/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.pdf",File::FNM_CASEFOLD) do |filepath|
      `pdftotext #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
      puts "#{num+=1} archivos convertidos\n"
      if  File.read(filepath.gsub('.pdf','.txt')).valid_encoding?
        HistoricalArchive.create(:route => "#{filepath.gsub("#{Rails.root}/public", '')}", :content => File.read(filepath.gsub('.pdf', '.txt')),
                                 :location => "SOLICITUDES ELECTRONICAS")
        puts "#{num1+=1} archivos registrados\n"
      end
    end
    puts "borrando archivos...\n"

    Dir.glob("#{Rails.root}/public/respaldos/JusticiaNet/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/**/*.txt",File::FNM_CASEFOLD) do |filepath|
      `rm -f #{filepath.gsub(' ','\ ').gsub('(','\(').gsub(')','\)').gsub('&'){'\&'}}`
    end
  end
end