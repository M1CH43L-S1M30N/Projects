require 'rspec'
require 'card'

describe Card do 
  describe '#initialize' do 
    subject(:card) {Card.new(:hearts, :deuce)}

    it 'creates the card correctly' do
      expect(card.value).to eq(:deuce)
      expect(card.suit).to eq(:hearts)
    end

    it 'raises an error if invalid suit' do
      expect (Card.new(:test, :deuce)).to raise_error
    end

    it 'raises an error if invalid value' do
      expect (Card.new(:hearts, :test)).to raise_error
    end
  end
end
