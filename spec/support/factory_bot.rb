# frozen_string_literal: true

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:all) do
    FactoryBot.rewind_sequences
  end
end
