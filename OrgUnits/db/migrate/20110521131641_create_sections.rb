class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.integer :service_id
      t.string :section_name
      t.string :schedule
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
    drop_table :sections
  end
end
