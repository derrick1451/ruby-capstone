require_relative 'app'
def main
  app = App.new
  app.load_collections

  loop do
    option = app.display_menu
    app.handle_option(option, app)

    break if option == 13
  end

  app.save_collections
end

main
