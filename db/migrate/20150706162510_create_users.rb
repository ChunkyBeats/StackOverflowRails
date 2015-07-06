class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :username, :string
      t.column :password_hash, :string
      t.column :password_salt, :string
      t.column :admin, :boolean

      t.timestamps
    end
  end
end
