require "byebug"
require 'lolize'
require 'rubygems'
require 'terminal-table/import'
$colorizer = Lolize::Colorizer.new
$count = 99
$iId = 0
$rId = 0
$stud = Array.new
$bookArr = Array.new
$h = Hash.new
$issueArr = Array.new
$returnArr = Array.new


	class Return
		attr_accessor :retid , :retStdId, :retBookname


		def self.returnRequest

			if $issueArr.empty?
			 	$colorizer.write "\t\t You have no book to return\n"
			else
				puts "Enter the book name, you want to return"
				
				$bookRetReq = gets.chomp.to_s

				ret = Return.new
				ret.retid = $rId+= 1
				ret.retStdId = $sid
				ret.retBookname = $bookRetReq

				$issueArr.each do |e|

					if(ret.retStdId == e.stdid and ret.retBookname == e.issueBookname )

						$returnArr << ret
						$returnArr.each do |i|
							puts "\t\t#{i.retid}\t #{i.retStdId}\t #{i.retBookname}\n\n"
							$colorizer.write "\t Your request has been submitted successfully\n\tyou will
							be able to see the request status soon\n "
							break 
						end
					else
						$colorizer.write "\t\tThis book is not issued to you\n"
					end
				end
			end	
		end	
		
		def self.returnBook
			if $returnArr.empty? == true
					$colorizer.write "\t\tNo one requested to return book currently\n" 
				else 

				returnBookList

				puts "Enter the student id to return book , from the above list "

				$retSudentId = gets.chomp.to_i
				
				puts "Enter the name of book to return" 

				$bookRet = gets.chomp.to_s

				$returnArr.each do |i|

					if($retSudentId == i.retStdId.to_i and $bookRet == i.retBookname )

						$bookArr.each do |e|
							if $bookRet == e.bname
								e.bquant+= 1
								break
							end
						end
						$colorizer.write "\tBook Returned successfully\n"
						break 
					end
				end
			end
		end
		def self.returnBookList

			if $returnArr.empty? == true
				$colorizer.write "\t\tNo one requested to return book currently\n" 
			else 

					return_table = table do |t|
						t.headings = 'Return ID', 'Student ID', 'Book Name'
						$returnArr.each do |i| 
							t << ["#{i.retid}",  "#{i.retStdId}", "#{i.retBookname}"]
						end
				end
					$colorizer.write "#{return_table}\n" 
			end
		end	
	end