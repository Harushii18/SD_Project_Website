class Schedule < ApplicationRecord

    belongs_to :student
    belongs_to :hospital
    belongs_to :specialty



    def self.delete_with_student_id(student_id)
        #puts("in schedule model file, studentID = " +student_id )
        @schedules_with_student_id = Schedule.where(student_id: student_id); # selects all schedules with student_id equal to the parameter student_id
        @schedules_with_student_id.each do |schedule|
            schedule.destroy
        end

    end

end
