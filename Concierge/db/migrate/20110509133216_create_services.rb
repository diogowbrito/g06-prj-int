class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :serviceName
      t.integer :service_id
      t.string :provider
      t.string :type
      t.integer :ranking
      t.string :imgPath

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
