# frozen_string_literal: true

require_relative '../bookstore'
require_relative 'add_book'
require_relative 'remove_book'

RSpec.describe Bookstore do
  describe 'Remove book' do
    let(:isbn) { '978-0553213119' }
    let!(:bookstore) do
      bookstore = Bookstore.new
      bookstore.add_book(
        arguments: {
          isbn: isbn,
          name: 'Moby Dick'
        }
      )

      return bookstore
    end

    context 'without an isbn' do
      it 'should raise an error' do
        expect do
          bookstore.remove_book(
            arguments: {
            }
          )
        end.to raise_error(HashCast::Errors::MissingAttributeError)
      end
    end

    context 'with a malformed isbn' do
      it 'should raise an error' do
        expect do
          bookstore.remove_book(
            arguments: {
              isbn: 1
            }
          )
        end.to raise_error(HashCast::Errors::CastingError)
      end
    end

    context 'with extra arguments' do
      it 'should raise an error' do
        expect do
          bookstore.remove_book(
            arguments: {
              isbn: isbn,
              extra: 'extra'
            }
          )
        end.to raise_error(HashCast::Errors::UnexpectedAttributeError)
      end
    end

    context 'with valid arguments' do
      it 'should remove the book from the inventory' do
        bookstore.remove_book(
          arguments: {
            isbn: isbn
          }
        )

        expect(bookstore.books).not_to include({ isbn: isbn })
      end
    end
  end
end
