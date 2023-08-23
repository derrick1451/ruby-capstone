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

  private

  def select_item_for(class_name)
    options = list_available_items

    if options.empty?
      puts 'You need to add a Item to the collection first'
      return false
    end

    display_items_options(options, class_name)

    print 'Select your Option: '
    option_id = gets.chomp.to_i

    items = options.values[option_id]

    items.each_with_index do |item, i|
      puts display_items_of_class(item, i)
    end

    print "\nEnter the Item Option: "
    item_index = gets.chomp.to_i

    if item_index.abs > items.length
      puts "We don't have that Item, try again.\n\n"
      return false
    end
    items[item_index]
  end
end
