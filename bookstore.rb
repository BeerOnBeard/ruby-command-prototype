# frozen_string_literal: true

##
# It's a store with books
class Bookstore
  attr_reader :books

  def initialize
    @books = []
  end
end
