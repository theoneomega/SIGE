class HistoricalArchive < ActiveRecord::Base
  attr_accessible :content, :route, :location

  searchable do
    text :content, :route
  end
end
