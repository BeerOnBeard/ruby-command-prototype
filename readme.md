# Command Pattern with Ruby

Prototyping to show different styles of applying commands to Ruby classes.

```bash
gem install bundler
bundle install
bundle exec rspec
```

## Concepts

Works on the principal that Ruby classes can be re-opened and added to. A folder named the same as the model contains commands. A file in this folder encapsulates a single command expressed as a public function on the class. The file also defines a module that encapsulates private methods used to decompose the public method for readability as well as an argument validator.

## Bookstore

The class definition is at the root and contains attribute definitions and an initializer.

First, let's look at the file `bookstore/add_book.rb`.

The file opens the class `Bookstore` and adds two things: a module named `AddBookCommand` and a method named `add_book`. `AddBookCommand` encapsulates `Arguments` for `add_book`. `Arguments` makes the contract explicit and gives consumers an easy way to create a valid hash for the `add_book` method.

In order to allow decomposing the `add_book` method as it grows in size, we need a place for private methods. However, including private methods in the class could cause collisions with other files clobbering the definition of the method with the last definition loaded. In order to avoid this, methods used to decompose `add_book` can be placed in the `AddBookCommand` module as static methods and referenced from `add_book`.

Although the `validate` method in both `add_book.rb` and `remove_book.rb` does nothing useful, it helps highlight the issue of colliding methods. Both methods, `add_book` and `remove_book`, rely on a private method `validate` to decompose the method into something readable for future developers. However, if the method was added to the class as a private method in each file, one of the definitions would be clobbered and both `add_book` and `remove_book` the one definition of `validate` that was last parsed by Ruby.
