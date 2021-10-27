class Programme < ApplicationRecord
    has_many :students, :dependent => :nullify
    has_many :groups, :dependent => :delete_all
    has_many :programme_courses, :dependent => :delete_all
end
