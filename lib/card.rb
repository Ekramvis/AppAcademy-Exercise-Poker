# -*- coding: utf-8 -*-

# Represents a playing card.
class Card
  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :two   => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  VALUE_RANKS = {
    :two   => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13,
    :ace   => 14
  }

	CARD_ORDER = [
    :two,
    :three,
    :four,
    :five,
    :six,
    :seven,
    :eight,
    :nine,
    :ten,
    :jack,
    :queen,
    :king,
    :ace
	]


	def self.suits
		SUIT_STRINGS.keys
	end

	def self.values
		VALUE_STRINGS.keys
	end

	attr_reader :suit, :value

	def initialize(suit, value)
		@suit, @value = suit, value
	end

	def same_suit?(other_card)
		self.suit == other_card.suit
	end

	def same_value?(other_card)
		self.value == other_card.value
	end

	def same_card?(other_card)
		same_suit?(other_card) && same_value?(other_card)
	end

	def compare(other_card)
		CARD_ORDER.index(self.value) <=> CARD_ORDER.index(other_card.value)
	end
end