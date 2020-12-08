
$LOAD_PATH << '.'
require "byebug"
require 'lolize'
require 'colorize'
$colorizer = Lolize::Colorizer.new
 require 'Return'
 require 'Issue'
 require 'Admin'
 require 'Student'

class Driver

	puts "Welcome to the Library Management"

	def self.head

		while true
			puts "Press 1: Admin"
			puts "Press 2: Student"
			puts "Press 3: Exit"
			num = gets.to_i

			case num
			when 1

				Admin.adminLogin

				while true	
				puts "Press 1: Manage Books"
				puts "Press 2: Manage Students"
				puts "Press 3: Go to Home"

				numA = gets.to_i

								
					
					case numA

					when 1

						while true

							puts "Press 1: Add Books"
							puts "Press 2: Remove Books"
							puts "Press 3: View Available Books"
							puts "Press 4: See Issue Requests"							
							puts "Press 5: Issue Books"
							puts "Press 6: Return Books"
							puts "Press 7: Back"


							numB = gets.chomp.to_i


							case numB

							when 1
								Admin.addBook
							when 2
								Admin.removeBook
							when 3
								Admin.bookList 	
							when 4
								Issue.issueRequestsList 	
							when 5
								Issue.issueBook 	
							when 6
								Return.returnBook 	
						
							when 7

								break
								
							else
								puts "Enter Valid Choice"	
							end
						end
						

					when 2
						while true
							puts "Press 1: Add Students"
							puts "Press 2: Remove Students"
							puts "Press 3: View Student List"
							puts "Press 4: Back"

							numC =gets.to_i



							case numC
							when 1
								Student.addStudent
							when 2

								Student.removeStudent
							when 3

								Student.studList 	

							when 4
								break

							else
								puts "Enter Valid Choice"	
							end
						end
					when 3
						break
					else
						puts "Enter Valid Choice"
					end
				end	 
				
			when 2
				while true

					puts "Press 1: Login"
					puts "Press 2: Register"
					puts "Press 3 : Go Back"

					num1 = gets.to_i 

					case num1
					when 1
						if $stud.empty?
							$colorizer.write "\t\tPlease First Register Yourself\n"		
						else	
						Student.login

						while true
							puts "Press s: Available Books"
							puts "Press i: Request to Issue Book"
							puts "Press r: Request to Return Book"
							puts "Press e: Request to Go Back"

							operation = gets.chomp.to_s

							case operation
								when "s"	
								Admin.bookList 	
								#byebug
								when "i"
								Issue.issueRequest
								when "r"
								Return.returnRequest
								when "e"
								break				
							else
								puts "Wrong Choice"
							end
						end
					end



					when 2
						Student.addStudent

					#when 3

					
					#when 4
					#	Issue.issueRequest	
					when 3
						break
					else
						puts "Please Enter Valid Choice"
					end
				end


			when 3
				#abort("\n Thank For Running Digital  
				$colorizer.write " \n Thank For Running Digital n"
				break

			else
				"Wrong Choice"
			end
		end
	end
end

Driver.head
