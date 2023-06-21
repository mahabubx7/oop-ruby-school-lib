require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts '---------------------------------------------------------'
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    puts '---------------------------------------------------------'
  end

  def list_people
    puts '---------------------------------------------------------'
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    puts '---------------------------------------------------------'
  end

  def create_teacher
    print "teacher's specialization: "
    specialization = gets.chomp
    print "teacher's age: "
    age = gets.chomp
    print "teacher's name: "
    name = gets.chomp
    teacher = Teacher.new(age, name, specialization, parent_permission: true)
    @people << teacher
    puts ''
    puts '<[#]> You have successfully registered a Teacher'
  end

  def create_student
    print '==> Age: '
    age = Integer(gets.chomp)
    print '==> Name: '
    name = gets.chomp
    print '<?> Has parent permission? [Y/N]'
    parent_permission = gets.chomp.downcase

    case parent_permission
    when 'n'
      student = Student.new(name, age, nil, parent_permission: false)
      @people << student
    when 'y'
      student = Student.new(name, age, nil, parent_permission: true)
      @people << student
    else
      '==> You have entered an invalid option'
    end

    puts ''
    puts '<[#]> You have successfully registered a Student'
  end

  def create_person
    puts 'Wha kind of person you want to create?'
    puts '(1) create a new student [or]'
    puts '(2) create a new teacher'
    print '==> (choose) : '
    selected_person_type = Integer(gets.chomp)
    case selected_person_type
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_book
    print '==> Title: '
    title = gets.chomp
    print '==> Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts ''
    puts '<[#]> You have successfully created a Book'
  end

  def create_rental
    return if @books.empty? || @people.empty?

    puts '-----> Select a book from the following list of number <-----'
    puts '---------------------------------------------------------'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    print '==> Choose a book: '
    selected_book = Integer(gets.chomp)
    puts '-----> Select a person from the following list of number (not ID) <-----'
    puts '---------------------------------------------------------'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
    end
    print '==> Choose a person: '
    selected_person = Integer(gets.chomp)
    print '==> Date: '
    selected_date = gets.chomp.to_s
    rented = Rental.new(selected_date, @books[selected_book], @people[selected_person])
    @rentals << rented
    puts ''
    puts '<[#]> Book was successfully rented. [Booked]'
  end

  def list_rental
    print '==> Enter the Person ID: '
    person_id = gets.chomp.gsub(/[[:space:]]/, '')
    puts '---------------------------------------------------------'
    @rentals.each do |rent|
      puts " Date: #{rent.date}, Book: #{rent.book.title} Author: #{rent.book.author}" if rent.person.id == person_id
    end
    puts '---------------------------------------------------------'
  end

  def invalid_option
    puts '[X]: Invalid option'
  end

  def options
    puts '-----> Please enter the number for the task you want to perform <-----'
    puts '==> Choose one of the following'
    puts ' 1 - List all books.'
    puts ' 2 - List all people.'
    puts ' 3 - Create a person (teacher or student).'
    puts ' 4 - Create a book.'
    puts ' 5 - Create a rental.'
    puts ' 6 - List all rentals for a given person id.'
    puts ' 7 - Exit'
  end
end
