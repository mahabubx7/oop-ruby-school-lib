require_relative '../lib/book'
require_relative '../lib/person'
require_relative '../lib/rental'
require 'date'

describe 'Unit tests for "Book" class' do
  book = Book.new('Ruby and OOP', 'F. Microverse')
  person = Person.new('Mahabub')
  rental_date = Date.new(2023, 6, 20)
  rental = Rental.new(rental_date, book, person)

  it 'should have a rental date' do
    expect(rental.date).to eq(rental_date)
  end

  it 'should have a book' do
    expect(rental.book).to eq(book)
  end

  it 'should booked by a person' do
    expect(rental.person).to eq(person)
  end
end
