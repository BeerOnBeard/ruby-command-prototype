# frozen_string_literal: true

require_relative '../bookstore'
require_relative 'add_book'

RSpec.describe Bookstore do
  describe 'Add book' do
    it 'should add a book to the inventory' do
      bookstore = Bookstore.new
      arguments = Bookstore::AddBookArguments.cast(
        {
          book: {
            name: 'Moby Dick'
          }
        }
      )

      bookstore.add_book(arguments: arguments)

      expect(bookstore.books).not_to be_empty
    end
  end
end
