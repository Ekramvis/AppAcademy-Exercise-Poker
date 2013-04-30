require 'rspec'
require 'hand'

describe Hand do

	subject(:hand) {Hand.new(deck.take(5))}
	let(:deck) {Deck.new}
	let(:flush) {[Card.new(:hearts, :two),
								Card.new(:hearts, :five),
								Card.new(:hearts, :seven),
								Card.new(:hearts, :queen),
								Card.new(:hearts, :ace)]
							}
	let(:unordered) {[Card.new(:hearts, :seven),
								Card.new(:hearts, :king),
								Card.new(:hearts, :seven),
								Card.new(:hearts, :ace),
								Card.new(:hearts, :two)]
							}
	let(:two_pair) {[Card.new(:hearts, :two),
								Card.new(:diamonds, :two),
								Card.new(:hearts, :seven),
								Card.new(:clubs, :seven),
								Card.new(:hearts, :ace)]
							}
	let(:straight) {[Card.new(:hearts, :five),
								Card.new(:diamonds, :six),
								Card.new(:hearts, :seven),
								Card.new(:clubs, :eight),
								Card.new(:hearts, :nine)]
							}
	let(:ace_high_straight) {[Card.new(:hearts, :ten),
								Card.new(:diamonds, :jack),
								Card.new(:hearts, :queen),
								Card.new(:clubs, :king),
								Card.new(:hearts, :ace)]
							}
	let(:ace_low_straight) {[Card.new(:hearts, :ace),
								Card.new(:diamonds, :two),
								Card.new(:hearts, :three),
								Card.new(:clubs, :four),
								Card.new(:hearts, :five)]
							}


	describe "#initialize" do

		it "should initialize with five cards" do
			hand.count.should == 5
		end

	end

	describe "#suit_counts" do
		it "returns a hash of suits and frequency" do
			hand = Hand.new(flush)
			hand.suit_counts[:hearts].should == 5
		end
	end

	describe "#value_counts" do
		it "returns a hash of values and frequency" do
			hand = Hand.new(two_pair)
			hand.value_counts[:two].should == 2
			hand.value_counts[:seven].should == 2
			hand.value_counts[:ace].should == 1
		end
	end

	describe "#straight?" do
		it "returns true if values are consecutive" do
			hand = Hand.new(straight)
			hand.straight?.should be_true
		end

		it "returns false if otherwise" do
			hand = Hand.new(flush)
			hand.straight?.should be_false
		end

		it "handles aces high" do
			hand = Hand.new(ace_high_straight)
			hand.straight?.should be_true
		end

		it "handles aces low" do
			hand = Hand.new(ace_low_straight)
			hand.straight?.should be_true
		end
	end

	describe "#order!" do

		it "sorts an unordered hand by values" do
			hand = Hand.new(unordered)
			hand.order!
			hand.cards.map {|card| card.value}.should == [:two, :seven, :seven, :king, :ace]
		end

	end



end