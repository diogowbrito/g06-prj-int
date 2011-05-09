class CreateCompetences < ActiveRecord::Migration
  def self.up
    create_table :competences do |t|
      t.integer :service_id
      t.string :competenceType
      t.string :competenceUrl
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :competences
  end
end
