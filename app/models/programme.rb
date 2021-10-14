class Programme < ApplicationRecord
    has_many :students
    has_many :groups, :dependent => :delete_all
end
