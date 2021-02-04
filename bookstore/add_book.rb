# frozen_string_literal: true

require 'hashcast'

class Bookstore
  module AddBookCommand
    class Arguments
      include HashCast::Caster

      attributes do
        string :isbn
        string :name, optional: true
      end
    end

    def self.validate
      puts 'Add'
    end
  end

  ##
  # Add a book
  #
  # @param [AddBookCommand::Arguments] arguments
  def add_book(arguments:)
    book = AddBookCommand::Arguments.cast(arguments)

    AddBookCommand.validate
    books.push(book)
  end
end
