
require "byebug"
require 'lolize'
require 'rubygems'
require 'terminal-table/import'
$colorizer = Lolize::Colorizer.new
$count = 99
$iId = 0
$rId = 0
$stud = []
$bookArr = Array.new
$h = Hash.new
$issueArr = Array.new
$returnArr = Array.new


class Issue

	attr_accessor :issueid , :stdid, :issueBookname

	def self.issueRequest

		puts "Enter the book name, you want to issue"

		$bookIssueReq = gets.chomp.to_s

		issue = Issue.new
		issue.issueid = $iId+= 1
		issue.stdid = $sid
		issue.issueBookname = $bookIssueReq
		$issueArr<<issue
		$issueArr.each do |i|
			puts "\t\t#{i.issueid}\t #{i.stdid}\t #{i.issueBookname}\n\n"
		end
		$colorizer.write "\t Your request has been submitted successfully\n\tyou will be able to see the request status soon\n " 
	end

	def self.issueRequestsList

		if $issueArr.empty? == true
			$colorizer.write "\t\tNo one requested for books currently\n" 
		else 
			issue_table = table do |t|
				t.headings = 'Book ID', 'Student ID', 'Book Name'
				$issueArr.each do |i| 
					t << ["#{i.issueid}",  "#{i.stdid}", "#{i.issueBookname}"]
				end
			end
			$colorizer.write "#{issue_table}\n" 
		end
	end

	def self.issueBook

	if $issueArr.empty? == true
			$colorizer.write "\t\tNo one requested for books currently\n" 
	
	else	
			issueRequestsList

			puts "Enter the student id from above list to whom you want to issue book" 

			$issueSudentId = gets.chomp.to_i

			puts "Enter the name of book to issue" 

			$bookname = gets.chomp.to_s

			$issueArr.each do |i|

				if($issueSudentId == i.stdid.to_i and $bookname == i.issueBookname )

					$bookArr.each do |e|
						if $bookname == e.bname
							e.bquant-= 1
							break
						end
					end
					$colorizer.write "\tBook Issued successfully\n"
					break 
				end
			end
		end
	end	
end
		
