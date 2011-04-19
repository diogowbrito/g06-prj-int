class CreateProfessors < ActiveRecord::Migration
  def self.up
    create_table :professors do |t|
      t.integer :professor_id
      t.string :professor_name
      t.string :sector
      t.string :category
      t.string :room
      t.string :building

      t.timestamps
    end
  end

  def self.down
    drop_table :professors
  end
end
