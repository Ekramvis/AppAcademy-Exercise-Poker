# -*- coding: utf-8 -*-

require_relative 'card'

class Deck

	def Deck.all_cards
		suits = Card.suits
		values = Card.values
		cards = []

		suits.each do |suit|
			values.each do |value|
				cards << Card.new(suit, value)
			end
		end

		cards
	end

	attr_reader :cards

	def initialize(cards = Deck.all_cards)
		@cards = cards
	end

	def shuffle!
		@cards.shuffle!
	end

	def count
		@cards.count
	end

	def take(n)
		raise "not enough cards" if n > self.count
		@cards.shift(n)
	end

	def replace(cards)
		@cards += cards
	end


end