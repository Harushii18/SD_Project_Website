class Block < ApplicationRecord
    has_many :groups
    has_many :hospital_assignments

    def self.import(file)
        #CSV.foreach(file.path, headers: true) do |row|
        #Block.create! row.to_hash
        #end
      end



end
