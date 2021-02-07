require './lib/player'
require './lib/card'
require './lib/deck'
require './lib/turn'

class Game

  attr_reader :player1_deck, :player2_deck

  def initialize
    @player1_deck = []
    @player2_deck = []
  end

  def start
    split_deck
    @deck1 = Deck.new(@player1_deck)
    @deck2 = Deck.new(@player2_deck)
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are Megan and Aurora."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    user_command = gets.chomp
    if user_command == "GO"
      play_game
    else
      "Read better. Try again."
    end
  end

  def create_deck
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    suits = [:spade, :heart, :clubs, :diamond]
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10',
            'Jack', 'Queen', 'King', 'Ace']

    ranks_values = Hash[ranks.zip(values)]
    main_deck = []
    suits.each do |suit|
      ranks_values.each do |key, value|
        main_deck << Card.new(suit, value, key)
      end
    end
    main_deck.shuffle
  end

  # def randomize
  #   create_deck.shuffle!
  # end

  def split_deck
    main_deck = create_deck
    # randomize
    @player1_deck, @player2_deck = main_deck.each_slice(main_deck.length / 2).to_a
  end

  def play_game
    turn_counter = 1
    until @turn.player1.has_lost? == true || @turn.player2.has_lost? || turn_counter == 50
      @turn.war_or_peace
      if @turn.type == :basic
        turn_counter += 1
        p "Turn #{turn_counter}: #{@turn.winner.name} won #{@turn.spoils_of_war.length} cards"
        p "Turn type: #{@turn.type}"
        p "Player1 card count: #{@player1.deck.cards.length}"
        p "Player2 card count: #{@player2.deck.cards.length}"
      elsif @turn.type == :war
        turn_counter += 1
        p "Turn #{turn_counter}: WAR - #{@player1.name} won #{@turn.spoils_of_war.length} cards"
      elsif @turn.type == :mutually_assured_destruction
        turn_counter += 1
        p "*mutually assured destruction* #{@turn.spoils_of_war.length} removed from play"
      end
    end
    #loop 1,000,000 times or until a player is out of cards
    #run war_or_peace until a player has lost, or a million runs
    #output turn #
    #output winner and cards won and winners card count
    #repeat
  end

end
