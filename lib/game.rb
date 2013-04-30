require_relative 'hand'
require_relative 'deck'
require_relative 'card'


class Game
	attr_accessor :players, :pot

	def initialize(p1, p2)
		@players = [p1, p2]
	end

	def setup_hand
		@pot = 0
		ante = 10
		@players.each do |player|
			if ante <= player.bankroll
				@pot += player.ante(ante)
			else
				@players.delete(player)
				#puts "Get the hell out, pauper #{player.name}!"
			end
		end
	end

end