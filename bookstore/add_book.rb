# frozen_string_literal: true

require 'hashcast'

class Bookstore
  class AddBookArguments
    include ::HashCast::Caster

    attributes do
      hash :book do
        string :name
      end
    end
  end

  def add_book(arguments:)
    books.push(arguments[:book])
  end
end
