class CsvsController < ApplicationController
    
  helper_method :add_csv

  def add_csv
    require 'csv'
    table = CSV.parse(File.read("D:/MyFiles/Study_Material/2021/Software_Design/csv_program/blocks.csv"), headers: true)
    table.each {|row|
    
                  puts("Start Date: " +row["BlockStartDate"])
                  puts("End Date: " +row["BlockEndDate"])
                  puts("")

              }
    respond_to do |format|
    format.js {render inline: "location.reload();", :notice => "notice" }
    end
  end
end
