require 'open-uri'

class GamesController < ApplicationController

  def new
    alphabet = ('A'..'Z').to_a
    @letters = 10.times.map { alphabet.sample }
  end

  def score
    @result = nil
    dictionary_serialized = URI.open("https://wagon-dictionary.herokuapp.com/#{params[:word]}").read
    dictionary = JSON.parse(dictionary_serialized)
    @english_word = dictionary['found']
    @word = params[:word].upcase
    @not_in_grid = !(params[:word].upcase.chars - params[:letters].strip.chars).empty?
    @letters = params[:letters]
  end
end
