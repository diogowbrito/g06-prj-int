class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.integer :course_id
      t.string :name
      t.string :sigla
      t.string :period
      t.string :degree
      t.string :regent

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
