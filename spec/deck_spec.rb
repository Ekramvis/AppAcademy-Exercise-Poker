require 'rspec'
require 'deck'

describe Deck do

	subject(:deck) {Deck.new(cards = Deck.all_cards)}

	describe "#::all_cards" do

    it "returns all cards without duplicates" do
      Deck.all_cards.map { |card| [card.suit, card.value] }
        .uniq.count.should == Deck.all_cards.count
    end
	end

	describe "#initialize" do

		it "will create a full deck of 52 cards" do
			deck.cards.count.should == 52
		end
	end

	describe "#shuffle!" do

		it "shuffles the deck" do
			top, bottom = deck.cards[0], deck.cards[-1]
			deck.shuffle!
			(top.same_card?(deck.cards[0]).should == false &&
			bottom.same_card?(deck.cards[-1]).should == false)
		end
	end

	describe "#take(n)" do

		it "returns an array of cards from the top of the deck" do
			deck.take(5).count.should == 5
		end

		it "reduces the size of the deck by the number drawn" do
			deck.take(5)
			deck.cards.count.should == 47
		end

		it "takes the top card" do
			top_card = deck.cards[0]
			taken_top = deck.take(1)[0]
			taken_top.same_card?(top_card).should be_true
		end


		it "doesn't allow you to take more cards than remain" do
			expect {deck.take(53)}.to raise_error "not enough cards"
		end
	end

	describe "#replace" do
		it "adds an array of cards to the bottom of the deck" do
			cards_taken = deck.take(5)
			deck.replace(cards_taken)
			deck.count.should == 52
		end

		it "puts the replaced cards on the bottom of the deck" do
			top_card = deck.cards[0]
			taken_top = deck.take(1)
			deck.replace(taken_top)
			top_card.same_card?(deck.cards[-1]).should be_true
		end

	end






















end # end whole file