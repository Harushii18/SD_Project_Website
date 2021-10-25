class Student < ApplicationRecord
    scope :filter_by_programme_id, -> (id) { where programme_id: id }
    belongs_to :user
    belongs_to :programme
    has_one :student_group

    has_many :schedules, :dependent => :delete_all 

end
