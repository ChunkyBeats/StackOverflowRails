class AlterAnswersAlterQuestions < ActiveRecord::Migration
  def change
    remove_column :answers, :accepted
    add_column :questions, :accepted_answer_id, :integer 
  end
end
