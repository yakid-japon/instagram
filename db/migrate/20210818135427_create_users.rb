class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email
      t.string :name
      t.string :username
      t.text :password_digest
      t.string :photo
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
