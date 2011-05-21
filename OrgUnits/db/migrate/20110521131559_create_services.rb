class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :service_name
      t.string :building
      t.string :space
      t.string :coordenator
      t.string :mail
      t.string :email
      t.string :telephone
      t.string :extension
      t.string :fax

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
