require 'rspec'
require 'game'

describe Game do
	subject(:game) {Game.new(p1, p2)}
	let(:p1) {double("player 1", :ante => 10, :bankroll => 100)}
	let(:p2) {double("player 2", :ante => 10, :bankroll => 8)}

	describe "#initialize" do

		it "initializes (by default) with two Players" do
			game.players.size == 2
		end
	end

	describe "#setup_hand" do


		it "sets the pot to 0" do
			game.setup_hand
			game.pot.should == 10 # 20 == sum of 1 ante
		end

		it "requires players to enter an ante" do
			p1.should_receive(:ante).with(10)
			game.setup_hand
			# make call to player.ante. deduct the
			# value of ante from his bankroll, and
			# add it to the pot
		end

		it "boots players without enough money to cover the ante" do
			game.setup_hand
			game.players.size.should == 1
		end

		it "deals to players that have anted" do
		end
	end

	describe "#play_hand" do
		it "calls setup_hand" do
		end

		it "calls for the first round of betting" do
		end

		it "prompts players to discard and draw" do
		end

		it "calls the second round of betting" do
		end

		it "decides the winner and pays out the pot" do
		end

	end


end