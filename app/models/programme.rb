class Programme < ApplicationRecord
    has_many :students
    has_many :groups
end
