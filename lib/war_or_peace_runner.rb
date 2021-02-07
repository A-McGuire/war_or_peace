class Runner
  attr_reader :main_deck
              :deck1
              :deck2
  def initialize
    @main_deck = []
    @deck1 = []
    @deck2 = []
  end
  require './lib/player'
  require './lib/card'
  require './lib/deck'
  require './lib/turn'




  def create_deck
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    suits = [:spade, :heart, :clubs, :diamond]
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10',
            'Jack', 'Queen', 'King', 'Ace']

    ranks_values = Hash[ranks.zip(values)]
    suits.each do |suit|
      ranks_values.each do |key, value|
        main_deck << Card.new(suit, value, key)
      end
    end
    main_deck
  end

  def randomize
    main_deck.shuffle
  end

  def split_deck
    randomize
    deck1, deck2 = main_deck.each_slice(main_deck.length / 2).to_a
  end

end
