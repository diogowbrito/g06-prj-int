class CreateSecretaries < ActiveRecord::Migration
  def self.up
    create_table :secretaries do |t|
      t.integer :organ_id
      t.string :secretary_name
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :secretaries
  end
end
