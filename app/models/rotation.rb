class Rotation < ApplicationRecord
    scope :filter_by_programme_id, -> (id) { where programme_id: id }
    belongs_to :programme
    #has_many :schedules, :dependent => :delete_all 

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
          Rotation.create! row.to_hash
        end
      end



end
