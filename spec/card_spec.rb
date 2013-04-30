require 'rspec'
require 'card'

describe Card do
	subject(:card) {Card.new(:clubs,:six)}

	describe "::suits" do

		it "should have four suits" do
			Card.suits.uniq.size.should == 4
		end

	end

	describe "::values" do

		it "should have 13 different values" do
			Card.values.uniq.size.should == 13
		end

	end

	describe "#initialize" do

		it "should initialize with a suit" do
			card.suit.should == :clubs
		end

		it "should initialize with a value" do
			card.value.should == :six
		end
	end

	describe "#same_suit?" do

		it "should return true if compared with card of same suit" do
			card.same_suit?(Card.new(:clubs, :eight)).should be_true
		end

		it "should return false otherwise" do
			card.same_suit?(Card.new(:diamonds, :six)).should be_false
		end
	end

	describe "#same_value?" do

		it "should return true if compared with card of same value" do
			card.same_value?(Card.new(:diamonds, :six)).should be_true
		end

		it "should return false otherwise" do
			card.same_value?(Card.new(:clubs, :eight)).should be_false
		end
	end

	describe "#same_card?" do

		it "should return if same suit and same value" do
			card.same_card?(Card.new(:clubs, :six)).should be_true
		end

		it "should return false otherwise" do
			card.same_card?(Card.new(:hearts, :six)).should be_false
		end
	end

	describe "compare" do

		it "tells you if your card is smaller" do
			card.compare(Card.new(:hearts, :eight)).should == -1
		end

		it "tells you if your card is bigger" do
			card.compare(Card.new(:hearts, :five)).should == 1
		end

		it "tells if your card has the same value" do
			card.compare(Card.new(:hearts, :six)).should == 0
		end

	end




end