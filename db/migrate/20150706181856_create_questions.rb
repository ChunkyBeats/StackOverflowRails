class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :text, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
