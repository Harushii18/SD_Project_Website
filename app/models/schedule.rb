class Schedule < ApplicationRecord

    belongs_to :student
    belongs_to :hospital
    belongs_to :specialty

    def self.create_with_form_data(student_id, rotation_id, specialty_id, hospital_id)
        puts('Create with form data')
        puts(student_id)
        @schedule = Schedule.new(:student_id => student_id, :specialty_id => specialty_id, :hospital_id => hospital_id)
        @schedule.save!
    end

    def self.update_with_form_data(student_id, rotation_id, specialty_id, hospital_id)
        puts('Update with form data')
        @schedule =Schedule.find_by(student_id: student_id)
        puts(@schedule.specialty_id)
        puts(@schedule.hospital_id)
        @schedule.update( :specialty_id => specialty_id, :hospital_id => hospital_id)
    end

end
