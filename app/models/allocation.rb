class Allocation < ApplicationRecord
    belongs_to :hospital
    belongs_to :specialty
    validates_presence_of :start_date, :end_date
    validate :validateStartDate
    validate :Allocations

    #checks is end date is later than start date
    def validateStartDate
      errors.add(:start_date, "must be earlier than end date") if
      self.start_date > self.end_date
    end

    def Allocations
      errors.add(:used_slots ,"must be less than the available slots") if
      self.used_slots > self.available_slots
    end
end
