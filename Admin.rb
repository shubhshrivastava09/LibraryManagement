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


class Admin

	attr_accessor :bid, :bname, :bquant

	def self.adminLogin
		$colorizer.write "Please Enter Admin Password: \t"
		adminpass = gets.to_i
		if(adminpass == 12345)
			$colorizer.write "\n\t\t Welcome to Admin Module\n\n"
		else
			puts " \t\t Sorry , You Entered Wrong Password:"
			adminLogin
		end
	end	

	def self.addBook

		book = Admin.new
		book.bid = $count += 1
		puts "Enter the name of book, to be added"
		book.bname = gets.chomp.to_s
		puts "Enter Quantities"
		book.bquant = gets.to_i
		$bookArr << book

		$colorizer.write " Book Added Successfully, Added Book Details Are\n\t\t #{ book.bid}\t #{ book.bname} \t #{ book.bquant}.\n "
			#$colorizer.write "\t\tPlease Login With Your Credentials\n"
		end	

		def self.removeBook

			if $stud.empty? == true
				$colorizer.write "\t\tSorry no registrations are available to delete\n"
			else
				puts "Enter Book Id to be Deleted"
				deleteBookId = gets.to_i
				$bookArr.each do |i| 
					if(deleteBookId == i.bid)
						$bookArr.delete(i)
						$colorizer.write "Book @ Id #{i.bid} Deleted Successfully\n" 			
						break
					end	
				end
			end	
		end

		def self.bookList

			if $bookArr.empty? == true
				$colorizer.write "\t\tSorry, no books are available currently\n" 

			else

				book_table = table do |t|
					t.headings = 'Book ID', 'Book Name', 'Quantity'
					$bookArr.each do |i| 
						t << ["#{i.bid}",  "#{i.bname}", "#{i.bquant}"]
						#	$colorizer.write "\t\t#{i.bid}\t #{i.bname}\t #{i.bquant}\n\n"
					end				
				end
				$colorizer.write "#{book_table}\n" 
			end
		end	
	end
