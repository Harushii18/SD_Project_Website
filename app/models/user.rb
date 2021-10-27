class User < ApplicationRecord
	has_secure_password
	validates :email, uniqueness: true
	validates :email, :user_FirstName,:user_Type, presence: true
  has_one :student, :dependent => :delete

	def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
          #format: User.new(:database_field_name => row["csv_column_header_name])
          @user = User.new(:email => row["email"], :user_FirstName => row["firstName"], :user_LastName => row["lastName"], :password => row["password"], :user_ContactNo => row["contactNo"], :user_Type => row["type"])

          
          #create a student with the same id as the user record
          puts(row["type"])
          if (row["type"] == "Student")
            if @user.save!
              @programme_temp = Programme.find_by(programme_code: row["programme_code"]).id
              @student = Student.new(:studentNumber => row["studentNumber"], :courseCodes => row["courseCodes"], :programme_id => @programme_temp, :user_id => @user.id)
          
              @student.save!
            end
          else
            @user.save!
          end #if else



        end #do
      end #self.import

end


#-----------------------------------------------------------------------------------
#table = CSV.parse(File.read(file.path), headers: true)
#table.each {|row|

              #puts("Start Date: " +row["BlockStartDate"])
#              puts("End Date: " +row["BlockEndDate"])
#              puts("")
              # Block.create(:BlockStartDate => row["BlockStartDate"], :BlockEndDate => row["BlockEndDate"])

#          }