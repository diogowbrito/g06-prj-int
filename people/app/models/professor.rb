class Professor < ActiveRecord::Base
  has_many :emails
  has_many :courses
end
