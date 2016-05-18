=begin
DESIGN
Class Requirements
 - at least 3 attributes (at least two data types)
 - at least 3 methods (at least one must take an argument)
 Release 2 Requirements
 - allow user to input as many instances of the class
 - instances are stored in an array
=end

class Book
  attr_reader :author
  attr_accessor :title, :price

  #initialize instance variables
  def initialize(author, title, price)
    @author = author
    @title = title
    @price = price.to_f
    @review = []
    @original_price = @price
  end
  
  #take string, add it to array
  def add_review(str)
    @review << str
  end
  
  #prints out review array
  def print_review()
    puts " Review(s) for #{title}"
    @review.each_index { |index| puts " Review #{index + 1}: #{@review[index]}"}
  end
  
  #takes in an integer representing a percentage and applies a discount
  def apply_discount(percentage)
    @discount = percentage.to_f 
    #the function to_f sets any invalid variable to 0. If not 0 apply discount
    if @discount != 0
      @price = @price - (@price * (@discount/100))
    end
  end

  #prints out information for book instance
  def show_book_info
    puts " Printing info for the book: #{@title}"
    puts " The author of is #{@author}"
    puts " The retail price is $#{@original_price}"
    if @discount != 0
      puts " With the #{@discount}% discount the book is $#{@price}"
    else
      puts " There are no discounts available"
    end
    if ! @review.empty?
      print_review
    else
      puts " There are no reviews available"
    end
    puts ""
  end
end


#DRIVER CODE

book_array = []
response = ""
while response != 'done'
  puts " Please enter an author"
  book_author = gets.chomp
  puts " Please enter a book title"
  book_title = gets.chomp
  puts " Please enter the retail price"
  book_price = gets.chomp
  book_instance =  Book.new(book_author, book_title, book_price)
  puts " If you have a discount please enter it now in whole numbers, otherwise type '0'"
  book_discount = gets.chomp
  book_review = ""
  while book_review != "no"
    puts " Would you like to add a review for the book, otherwise type 'no'"
    book_review = gets.chomp.downcase
    if book_review != "no"
      book_instance.add_review(book_review)
    end
  end
  book_instance.apply_discount(book_discount)
  puts " Press any key to continue or type 'done' to finish"
  response = gets.chomp

  book_array << book_instance
end



book_array.each {|book| book.show_book_info}
