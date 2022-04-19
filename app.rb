require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require './rental'
require './menu_module'
require 'json'
require './data/read_data'
require './data/write_data'

class App < Module
  def initialize
    @books = []
    @persons = []
    @rentals = []
    super()
  end

  def list_all_books
    puts 'List is empty! Add a book.' if @books.empty?
    @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_persons
    puts 'List is empty! Add a person.' if @persons.empty?
    @persons.each { |person| puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}" }
  end

  def create_person
    print 'To create a student, press (1), to create a teacher, press (2) : '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Try again'
    end
    save_persons
  end

  def create_student
    puts 'Create a new student'
    print 'Enter student age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      student = Student.new(age, 'classroom', name, false)
    when 'y'
      student = Student.new(age, 'classroom', name, true)
    end
    @persons << student
    puts 'Student created successfully.'
  end

  def create_teacher
    puts 'Create a new teacher'
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @persons << teacher
    puts 'Teacher created successfully.'
  end

  def create_book
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets
    book = Book.new(title, author)
    @books << book
    puts "Book #{title} created successfully."
    save_books
  end

  def create_rental
    puts 'Select which book you want to rent by its number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the list by its number'
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" # person.class.name
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @persons[person_id], @books[book_id])
    @rentals << rental

    puts 'Rental created successfully'

    save_rentals(date, person_id, book_id)
  end

  def list_all_rentals
    return puts 'No person available' if @persons.empty?

    print 'Enter ID of the person: '

    person_id = gets.chomp.to_i
    person_fetch = @persons.select { |person| person.id == person_id }

    puts 'Rentals: '
    return puts 'No records where found for the given ID' if person_fetch.empty?

    person_fetch[0].rentals.each do |rental|
      puts "Date: #{rental.date} Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def store
    @persons = read_person
    @books = read_book
    @rentals = read_rentals
  end
end
