class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password
      t.string :password_digest
      t.string :remember_digest
      t.timestamps
  end
    
    create_table :rooms do |t|
      t.integer :owner_id
      t.text :name
      t.boolean :private
      t.boolean :console
      t.boolean :desktop
      t.boolean :mobile
      t.timestamps
    end

    create_table :users_rooms, id: false do |t|
      t.belongs_to :users, index: true
      t.belongs_to :rooms, index: true
    end

  end
end
