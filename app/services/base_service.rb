# frozen_string_literal: true

class BaseService
  private_class_method :new

  class << self
    def call(*arguments)
      new(*arguments).call
    end
  end
end
