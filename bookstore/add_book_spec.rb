# frozen_string_literal: true

require_relative '../bookstore'
require_relative 'add_book'

RSpec.describe Bookstore do
  describe 'Add book' do
    let!(:bookstore) { Bookstore.new }
    let(:isbn) { '978-0553213119' }

    context 'with missing parameters' do
      it 'should raise an error' do
        expect do
          bookstore.add_book(
            arguments: {
            }
          )
        end.to raise_error(HashCast::Errors::MissingAttributeError)
      end
    end

    context 'with invalid parameters' do
      it 'should raise an error' do
        expect do
          bookstore.add_book(
            arguments: {
              isbn: 1
            }
          )
        end.to raise_error(HashCast::Errors::CastingError)
      end
    end

    context 'with extra parameters' do
      it 'should raise an error' do
        expect do
          bookstore.add_book(
            arguments: {
              isbn: isbn,
              extra: 'extra'
            }
          )
        end.to raise_error(HashCast::Errors::UnexpectedAttributeError)
      end
    end

    context 'with valid parameters' do
      it 'should add a book to the inventory' do
        bookstore.add_book(
          arguments: {
            isbn: isbn
          }
        )

        expect(bookstore.books).to include({ isbn: isbn })
      end
    end
  end
end
