# frozen_string_literal: true

require 'hashcast'

class Bookstore
  module RemoveBookCommand
    class Arguments
      include HashCast::Caster

      attributes do
        hash :book do
          string :name
        end
      end
    end

    def self.validate
      puts 'Remove'
    end
  end

  ##
  # Remove a book
  #
  # @param arguments [RemoveBookCommand::Arguments]
  def remove_book(arguments:)
    RemoveBookCommand.validate
    book = books.find { |b| b[:name] == arguments[:book][:name] }
    books.delete(book)
  end
end
