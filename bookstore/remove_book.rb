# frozen_string_literal: true

require 'hashcast'

class Bookstore
  module RemoveBookCommand
    class BadArgumentsError < StandardError
    end

    class Arguments
      include HashCast::Caster

      attributes do
        string :isbn
      end
    end

    def self.validate
      puts 'Remove'
    end
  end

  ##
  # Remove a book
  #
  # @param [RemoveBookCommand::Arguments] arguments
  def remove_book(arguments:)
    book = RemoveBookCommand::Arguments.cast(arguments)

    RemoveBookCommand.validate
    book_to_delete = books.find { |b| b[:isbn] == book[:isbn] }
    books.delete(book_to_delete)
  end
end
