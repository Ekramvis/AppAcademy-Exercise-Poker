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
								Card.new(:diamonds, :seven),
								Card.new(:hearts, :ace),
								Card.new(:hearts, :two)]
							}
	let(:unordered_straight) {[Card.new(:hearts, :seven),
								Card.new(:hearts, :five),
								Card.new(:diamonds, :eight),
								Card.new(:hearts, :nine),
								Card.new(:hearts, :six)]
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
	let(:four_kind) {[Card.new(:hearts, :ace),
								Card.new(:diamonds, :ace),
								Card.new(:hearts, :three),
								Card.new(:clubs, :ace),
								Card.new(:spades, :ace)]
							}
	let(:full_house) {[Card.new(:hearts, :ace),
								Card.new(:diamonds, :three),
								Card.new(:hearts, :three),
								Card.new(:clubs, :ace),
								Card.new(:spades, :ace)]
							}
	let(:three_kind) {[Card.new(:hearts, :ace),
								Card.new(:diamonds, :ace),
								Card.new(:hearts, :three),
								Card.new(:clubs, :four),
								Card.new(:spades, :ace)]
							}
	let(:pair) {[Card.new(:hearts, :ace),
								Card.new(:diamonds, :ace),
								Card.new(:hearts, :three),
								Card.new(:clubs, :six),
								Card.new(:spades, :seven)]
							}
	let(:royal_flush) {[Card.new(:hearts, :ace),
								Card.new(:hearts, :king),
								Card.new(:hearts, :jack),
								Card.new(:hearts, :queen),
								Card.new(:hearts, :ten)]
							}
	let(:straight_flush) {[Card.new(:hearts, :nine),
								Card.new(:hearts, :king),
								Card.new(:hearts, :jack),
								Card.new(:hearts, :queen),
								Card.new(:hearts, :ten)]
							}
	let(:no_hand) {[Card.new(:hearts, :nine),
								Card.new(:hearts, :king),
								Card.new(:spades, :two),
								Card.new(:hearts, :queen),
								Card.new(:hearts, :ten)]
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

		it "finds a straight in an unordered hand" do
			hand = Hand.new(unordered_straight)
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

	describe "#flush?" do
		it "returns true if hand is flush" do
			hand = Hand.new(flush)
			hand.flush?.should be_true
		end

		it "returns false if otherwise" do
			hand = Hand.new(unordered)
			hand.flush?.should be_false
		end
	end

	describe "#four_kind?" do
		it "correctly identifies four of a kind" do
			hand = Hand.new(four_kind)
			hand.four_kind?.should be_true
		end

		it "returns false otherwise" do
			hand = Hand.new(flush)
			hand.four_kind?.should be_false
		end
	end

	describe "#full_house?" do
		it "correctly identifies a full house" do
			hand = Hand.new(full_house)
			hand.full_house?.should be_true
		end

		it "returns false otherwise" do
			hand = Hand.new(flush)
			hand.full_house?.should be_false
		end
	end

	describe "#three_kind?" do
		it "correctly identifies three of a kind" do
			hand = Hand.new(three_kind)
			hand.three_kind?.should be_true
		end

		it "returns false otherwise" do
			hand = Hand.new(pair)
			hand.three_kind?.should be_false
		end
	end

	describe "#hand_value" do
		it "finds a royal flush in a hand" do
			hand = Hand.new(royal_flush)
			hand.hand_value.should == :rf
		end

		it "finds a straight flush in a hand" do
			hand = Hand.new(straight_flush)
			hand.hand_value.should == :sf
		end

		it "finds a flush in a hand" do
			hand = Hand.new(flush)
			hand.hand_value.should == :fl
		end

		it "finds a straight in a hand" do
			hand = Hand.new(straight)
			hand.hand_value.should == :st
		end

		it "finds a four of a kind" do
			hand = Hand.new(four_kind)
			hand.hand_value.should == :fk
		end

		it "finds a full_house" do
			hand = Hand.new(full_house)
			hand.hand_value.should == :fh
		end

		it "finds a three of a kind" do
			hand = Hand.new(three_kind)
			hand.hand_value.should == :tk
		end

		it "finds two pair" do
			hand = Hand.new(two_pair)
			hand.hand_value.should == :tp
		end

		it "finds a pair" do
			hand = Hand.new(pair)
			hand.hand_value.should == :op
		end

		it "tells us if no hand is present" do
			hand = Hand.new(no_hand)
			hand.hand_value.should == :nh
		end
	end

	describe "#compare_hand" do
		it "returns 1 if your hand is better" do
			hand = Hand.new(flush)
			other_hand = Hand.new(two_pair)
			hand.compare(other_hand).should == 1
		end

		it "returns -1 if your hand is worse" do
			hand = Hand.new(pair)
			other_hand = Hand.new(full_house)
			hand.compare(other_hand).should == -1
		end

		it "returns 0 if hands are of same rank" do
			hand = Hand.new(royal_flush)
			other_hand = Hand.new(royal_flush)
			hand.compare(other_hand).should == 0
		end
	end

end