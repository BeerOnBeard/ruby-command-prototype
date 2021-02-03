# frozen_string_literal: true

require 'hashcast'

class Bookstore
  module AddBookCommand
    class Arguments
      include HashCast::Caster

      attributes do
        hash :book do
          string :isbn
          string :name
        end
      end
    end

    def self.validate
      puts 'Add'
    end
  end

  ##
  # Add a book
  #
  # @param arguments [AddBookCommand::Arguments]
  def add_book(arguments:)
    AddBookCommand.validate
    books.push(arguments[:book])
  end
end
