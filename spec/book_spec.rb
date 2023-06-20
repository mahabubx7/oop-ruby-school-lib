require_relative '../lib/book'

describe 'Unit tests for "Book" class' do
  book = Book.new('Ruby and OOP', 'F. Microverse')

  it 'should return a book title' do
    expect(book.title).to eq('Ruby and OOP')
  end

  it 'should return a book author' do
    expect(book.author).to eq('F. Microverse')
  end
end
