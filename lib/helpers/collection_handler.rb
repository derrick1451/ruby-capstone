require_relative './preserve_data'

module CollectionHandler
  include PreserveData
  attr_reader :albums, :genres, :labels, :items

end
