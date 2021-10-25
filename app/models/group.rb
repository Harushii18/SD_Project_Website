class Group < ApplicationRecord
  belongs_to :programme
  has_many :student_groups, :dependent => :delete_all
end
