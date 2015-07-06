class QuestionsController < ApplicationController
  def create
    question = current_user.questions.new(question_params)
    if question.save
      flash[:notice] = "You've successfully posted the question."
      redirect_to root_path
    else
      flash[:alert] = "Could not post question."
      redirect_to :back
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to :back
  end

  private
  def question_params
    params.require(:question).permit(:text, :accepted_answer_id)
  end
end
