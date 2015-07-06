class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.column :text, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
