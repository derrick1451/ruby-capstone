require_relative 'app'
def main
  app = App.new
  app.load_collections
  option = nil
  puts 'Welcome To Catalog Of My Things App'
#loop begin here
  loop do
    option = app.display_menu
    option = gets.chomp.to_i
    app.handle_option(option, app)
    break if option == 13
  end
  app.save_collections
  puts "\nSaving and exiting..."
end

main
