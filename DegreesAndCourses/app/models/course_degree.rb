class CourseDegree < ActiveRecord::Base
  belongs_to :course
  belongs_to :degree
end
