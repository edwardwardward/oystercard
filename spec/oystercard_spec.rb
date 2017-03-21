require 'oystercard'

describe Oystercard do
  subject(:oystercard)  { described_class.new }

  describe '#initialize' do
    it "card initialized with 0 balance" do
      expect(oystercard.return_balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'tops up with a user defined amount' do
      oystercard.top_up(10)
      expect(oystercard.return_balance).to eq 10
    end
    it 'can top up the balance' do
    expect{ oystercard.top_up 1 }.to change{ oystercard.return_balance }.by 1
    end

    it "To protect the user the card should have a maxium of £90" do
      maximum_balance = described_class::MAXIMUM_LIMIT
      message = "Error: Maximum of £#{maximum_balance} stored on card"
      oystercard.top_up(maximum_balance)
      expect {oystercard.top_up(1)}.to raise_error message
    end
  end


end
