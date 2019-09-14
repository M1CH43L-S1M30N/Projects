require 'deck'
require 'rspec'

describe Deck do

  describe "::all_cards" do 
    subject(:all_cards) { Deck.all_cards }
    
    it "should create 52 cards" do
      expect(all_cards.count).to eq(52)
    end

    it "should all be unique cards" do
      expect(
        all_cards.map { |card| [card.suit, card.value] }.uniq.count
      ).to eq(all_cards.count)
    end
  end

  let(:cards) do
    [ double("card", :suit => :hearts, :value => :ace),
      double("card", :suit => :hearts, :value => :king),
      double("card", :suit => :hearts, :value => :queen) ]
  end
  
  describe '#initialize' do
    it 'by default has 52 cards' do
      deck = Deck.new
      expect(deck.count).to eq(52)
    end

    it "can be initialized with an array of cards" do
      deck = Deck.new(cards)
      expect(deck.count).to eq(3)
    end
  end

  let(:deck) do
    Deck.new(cards.dup)
  end
  
  it "shouldn't reveal cards" do 
    expect(deck).to_not respond_to(:cards)
  end

  describe "#draw" do
    it "draws from top of deck" do 
      expect(deck.take(1)).to eq(cards[0..0])
      expect(deck.take(2)).to eq(cards[1..2])
    end

    it "removes cards from deck" do 
      deck.draw(2)
      expect(deck.count).to eq(1)
    end

    it "raise an error when you draw more cards than are in the deck" do
      expect(deck.draw(10)).to raise_error("not enough cards in the deck")
    end
  end

  describe '#return' do 
    let(:more_cards) do
      [ double("card", :suit => :spades, :value => :ace),
      double("card", :suit => :spades, :value => :king),
      double("card", :suit => :spades, :value => :queen) ]
    end

    it 'returns cards to deck' do
      deck.return(more_cards)
      expect(deck.count).to eq(6)
    end

    it 'adds cards to bottom of deck' do
      expect(deck[3..-1]).to eq(more_cards)
    end

    it 'should not mutate the original array' do 
      expect{deck.return(more_cards)}.to_not change{more_cards}
    end
  end

  describe '#shuffle' do 
    let(:og_deck) {deck.dup}

    it 'shuffles the deck' do 
      expect(deck.shuffle).to_not eq(og_deck)
    end
    
    it 'does not change the size of the deck' do
      expect(deck.count).to eq(og_deck.count)
    end
  end

  describe '#dup' do
    it 'should duplicate the deck' do
      expect(deck.dup.object_id).to_not eq(deck.object_id)
    end

    it 'should not modify original deck' do
      expect(deck.dup).to eq(deck)
    end
  end

  describe '#deal_hand' do
    let(:deck) {Deck.new}

    it 'should deal five cards' do
      hand = deck.deal_hand
      expect(hand).to be_a(Hand)
      expect(hand.cards.count).to eq(5)
    end

    it 'should remove dealt cards from deck' do
      expect(deck.deal_hand).to change{deck.count}.by(-5)
    end
  end
end