# -*- coding: utf-8 -*-

class Player
	attr_accessor :hand, :bankroll, :name

	def initialize(name = "gambler", bankroll = 100)
		@name = name
		@bankroll = bankroll
	end

	def ante(n)
		@bankroll -= n
		n
	end

end