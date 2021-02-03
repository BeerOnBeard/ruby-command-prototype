# frozen_string_literal: true

require 'hashcast'

module BrewStoreCommands
  class AddBrewArguments
    include HashCast::Caster

    attributes do
      hash :brew do
        string :name
      end
    end
  end

  module AddBrew
    ##
    # Add a brew to the inventory
    #
    # @param arguments [AddBrewArguments]
    def add_brew(arguments:)
      brews.push(arguments[:brew])
    end
  end
end
