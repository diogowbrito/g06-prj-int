class CreateOrgans < ActiveRecord::Migration
  def self.up
    create_table :organs do |t|
      t.string :organ_name
      t.string :building
      t.string :space
      t.string :president
      t.string :subdirector
      t.string :mail
      t.string :email
      t.string :telephone
      t.string :extension
      t.string :fax

      t.timestamps
    end
  end

  def self.down
    drop_table :organs
  end
end
