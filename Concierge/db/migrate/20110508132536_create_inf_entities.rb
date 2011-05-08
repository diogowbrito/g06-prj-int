class CreateInfEntities < ActiveRecord::Migration
  def self.up
    create_table :inf_entities do |t|
      t.string :serviceName
      t.string :entity

      t.timestamps
    end
  end

  def self.down
    drop_table :inf_entities
  end
end
