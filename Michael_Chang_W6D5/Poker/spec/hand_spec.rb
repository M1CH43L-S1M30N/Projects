require "hand"
require 'card'
require "rspec"

describe Hand do
  let(:cards) {[
    Card.new(:hearts, :deuce)
    Card.new(:hearts, :king)
    Card.new(:hearts, :queen)
    Card.new(:hearts, :jack)
    Card.new(:hearts, :seven)
  ]}

  subject(:hand) { Hand.new(cards) }
  
  describe "#initialize" do
    it "create a hand correctly" do
      expect(hand.cards).to eq(cards)
    end

    it "raises an error if not five cards" do
      expect(Hand.new([])).to raise_error("must have five cards")
    end
  end

  describe 'redraw' do
    let(:discard) {[hand.cards[0], hand.cards[-1]]}
    
    it 'throws away the chosen cards' do
      hand.redraw(discard)
      expect(hand.cards).to_not include(*discard)
    end

    it 'draws same amount of cards' do
      hand.redraw(discard)
      expect(hand.cards.count).to eq(5)
    end

    it 'raises error if discards more than three' do
      expect(hand.redraw(cards)).to raise_error 'can only discard up to three cards'
    end

    it 'raises error if discards unowned card' do
      expect(hand.redraw([Card.new(:diamonds, :ten)])).to raise_error "you don't have that card"
    end
  end
end