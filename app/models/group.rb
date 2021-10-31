class Group < ApplicationRecord
  has_many :student_groups, :dependent => :delete_all
  belongs_to :programme
  
end
