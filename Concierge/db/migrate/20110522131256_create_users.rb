class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :userName
      t.string :email
      t.string :passwordHash
      t.string :passwordSalt
      t.integer :activateCode

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
