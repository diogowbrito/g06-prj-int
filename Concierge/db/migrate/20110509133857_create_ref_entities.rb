class CreateRefEntities < ActiveRecord::Migration
  def self.up
    create_table :ref_entities do |t|
      t.integer :service_id
      t.string :entity

      t.timestamps
    end
  end

  def self.down
    drop_table :ref_entities
  end
end
