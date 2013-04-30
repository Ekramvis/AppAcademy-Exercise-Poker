require 'rspec'
require 'player'

describe Player do
	subject(:player) {Player.new}

	describe "#initialize" do

		it "should have a name" do
			player.name.should == "gambler"
		end

		it "should have a bankroll" do
			player.bankroll.should == 100
		end
	end

	describe "#ante" do

		it "should return the amount of the ante" do
			player.ante(10).should == 10
		end

		it "should deduct the ante from the bankroll" do
			player.ante(10)
			player.bankroll.should == 90
		end
	end

	describe "#hand" do
		let(:hand) {double("hand")}

		it "can be dealt a hand" do
			player.hand = hand
			player.hand.should == hand
		end
	end

end