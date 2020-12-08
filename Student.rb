
$LOAD_PATH << '.'
require "byebug"
require 'lolize'
require 'rubygems'
require 'terminal-table/import'
#require 'IssueClass'
$colorizer = Lolize::Colorizer.new
$count = 99
$iId = 0
$rId = 0
$stud = Array.new
$bookArr = Array.new
$issueArr = Array.new
$returnArr = Array.new


		class Student
	  
	  	attr_accessor :id, :name, :pass      # Notice that we used the special 

			def self.login()     # System Login

						puts "Please Enter Student Id"
						$sid = gets.chomp.to_i
						puts "Enter Password"
						$pass = gets.chomp.to_i

					if ($sid == $issueSudentId)
						$colorizer.write "\tCongratulations,your issue request for #{$bookname} book has been approved"
					end

				$stud.each do |i| 

					if($sid == i.id) and ($pass == i.pass.to_i)

						$colorizer.write "\t\tHello, Welcome to Student Library #{i.name.upcase} \n"
					else
						puts " Please Enter Correct Password"
					end
				end
			end



			def self.addStudent

				student = Student.new
				student.id = $count += 1
				puts "Enter Student Name"
				student.name = gets.chomp.to_s
				puts "Enter Password"
				student.pass = gets.chomp.to_s
				$stud << student

				$colorizer.write " Student Registered Successfully, Acoount Id Is #{ student.id} and Password is #{ student.pass}.\n "
				#$colorizer.write "\t\tPlease Login With Your Credentials\n"
			end	

			def self.studList

				if $stud.empty? == true
				$colorizer.write "\t\tSorry, currently the list is empty\n"

				else
				
					user_table = table do |t|
						t.headings = 'StudentID', 'Student Name', 'Password'
						$stud.each do |i|
							t << ["#{i.id}",  "#{i.name}", "#{i.pass}"]
						end
					end
						$colorizer.write "#{user_table}\n" 
				end
			end


			def self.removeStudent

				if $stud.empty? == true
					$colorizer.write "\t\tSorry no registrations are available to delete\n"
				else
					puts "Enter Student Id to be Deleted"

					deleteId = gets.to_i

					$stud.each do |i| 

						if(deleteId == i.id)

							$stud.delete(i)
							$colorizer.write "Student with Id #{i.id} Deleted Successfully\n" 			
							break
						end	
					end
				end
			end	
		end

