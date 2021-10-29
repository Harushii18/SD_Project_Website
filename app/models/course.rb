class Course < ApplicationRecord
    has_many :course_specialties, :dependent => :delete_all
    has_many :programme_courses, :dependent => :delete_all

end
