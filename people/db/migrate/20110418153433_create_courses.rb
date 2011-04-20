class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.integer :professor_id
      t.string :course_name
      t.string :department
      t.string :degree_name

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
