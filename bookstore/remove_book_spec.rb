# frozen_string_literal: true

require_relative '../bookstore'
require_relative 'add_book'
require_relative 'remove_book'

RSpec.describe Bookstore do
  describe 'Remove book' do
    let!(:bookstore) do
      bookstore = Bookstore.new
      arguments = Bookstore::AddBookCommand::Arguments.cast(
        {
          book: {
            name: 'Moby Dick'
          }
        }
      )

      bookstore.add_book(arguments: arguments)

      return bookstore
    end

    it 'should add a book to the inventory' do
      arguments = Bookstore::RemoveBookCommand::Arguments.cast(
        {
          book: {
            name: 'Moby Dick'
          }
        }
      )

      bookstore.remove_book(arguments: arguments)

      expect(bookstore.books).to be_empty
    end
  end
end
