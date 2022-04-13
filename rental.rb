require './person'
require './book'

class Rental
  attr_accessor :person, :book, :date

  def initialize(date, person, book)
    @person = person
    @book = book
    @date = date
    person.rentals << self
    book.rentals << self
  end
end
