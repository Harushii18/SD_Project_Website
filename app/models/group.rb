class Group < ApplicationRecord

  belongs_to :specialty
  has_many :group_assignments, :dependent => :delete_all 

end
