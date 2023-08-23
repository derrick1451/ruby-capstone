require_relative './preserve_data'

module CollectionHandler
  include PreserveData
  attr_reader :albums, :genres, :labels, :items
  def instantiate_common_variables
    @albums = []
    @genres = []
    @labels = []
    @items = {}
    @authors = []
  end
end
