class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.column :user_id, :integer
      t.column :votable_id, :integer
      t.column :votable_type, :string

      t.timestamps
    end
  end
end
