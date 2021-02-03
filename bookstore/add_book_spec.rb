# frozen_string_literal: true

require_relative '../bookstore'
require_relative 'add_book'

RSpec.describe Bookstore do
  describe 'Add book' do
    let!(:bookstore) { Bookstore.new }

    it 'should add a book to the inventory' do
      arguments = Bookstore::AddBookCommand::Arguments.cast(
        {
          book: {
            isbn: '978-0553213119',
            name: 'Moby Dick'
          }
        }
      )

      bookstore.add_book(arguments: arguments)

      expect(bookstore.books).not_to be_empty
    end
  end
end
