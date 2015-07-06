class HomeController < ApplicationController
  def index
    @questions = Question.sort_by_votes
  end

end
