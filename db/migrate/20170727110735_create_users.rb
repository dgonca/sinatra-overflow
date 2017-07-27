class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username, null: false, unique: true
      t.string :email, null:false, unique: true
      t.string :hashed_password, null: false

      t.timestamps
    end
  end
end
