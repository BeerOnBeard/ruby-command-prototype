# frozen_string_literal: true

require_relative 'brew_store_commands/add_brew'

class BrewStore
  attr_reader :brews

  def initialize
    @brews = []
  end

  include BrewStoreCommands::AddBrew
end
