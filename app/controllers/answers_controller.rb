class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @question.answers << @answer
    current_user.answers << @answer
    if @answer.save
      flash[:notice] = "Answer successfully posted!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Must provide an answer"
      redirect_to :back
    end
  end

  # def update
  #   @question = Question.find(params[:question_id])
  #   @answer = Answer.find(params[:id])
  #   if @answer.update(answer_params)
  #     redirect_to question_path(@question)
  #   else
  #
  #   end
  # end

  private
  def answer_params
    params.require(:answer).permit(:text, :accepted)
  end

end
