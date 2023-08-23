class Game
    attr_accessor :multiplayer, :last_played_at
  
    def initialize(multiplayer: false, last_played_at: nil)
      @multiplayer = multiplayer
      @last_played_at = last_played_at
    end
  
    def play
      # Do something to play the game.
    end
  end