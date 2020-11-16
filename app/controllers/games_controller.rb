class GamesController < ApplicationController
  def new
    @letters = 9.times.map { ('A'..'Z').to_a.sample }
  end

  def score
    letters = params[:letters].downcase.split('')

    if included?(params[:answer], letters)
      @answer = "your #{params[:answer]} is valid"
    else
      @answer = "invalid answser"
    end
  end
end

def included?(guess, grid)
  guess.downcase.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
end
