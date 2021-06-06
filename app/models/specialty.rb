class Specialty < ApplicationRecord
    #the delete all method will delete all records that are associated to it in other tables
    has_many :groups, :dependent => :delete_all 
    has_many :course_specialties, :dependent => :delete_all
    has_many :schedules
end
