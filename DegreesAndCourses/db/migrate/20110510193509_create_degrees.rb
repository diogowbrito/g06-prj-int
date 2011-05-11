class CreateDegrees < ActiveRecord::Migration
  def self.up
    create_table :degrees do |t|
      t.integer :degree_id
      t.string :name
      t.string :sigla
      t.string :type
      t.string :department

      t.timestamps
    end
  end

  def self.down
    drop_table :degrees
  end
end
