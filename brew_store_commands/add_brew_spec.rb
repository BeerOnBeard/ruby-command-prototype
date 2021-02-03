# frozen_string_literal: true

require_relative '../brew_store'
require_relative 'add_brew'

RSpec.describe BrewStore do
  describe 'Add brew' do
    it 'should add a brew to the inventory' do
      brew_store = BrewStore.new
      arguments = BrewStoreCommands::AddBrewArguments.cast(
        {
          brew: {
            name: 'Pliny the Elder'
          }
        }
      )

      brew_store.add_brew(arguments: arguments)

      expect(brew_store.brews).not_to be_empty
    end
  end
end
