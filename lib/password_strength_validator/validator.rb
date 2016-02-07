require 'ostruct'

module PasswordStrengthValidator
  DEFAULT_OPTIONS = {
    min_length:  8,
    max_length: 72,
    require_uppercase: true,
    require_lowercase: true,
    number_of_digits:  1,
    number_of_symbols: 0,
  }.freeze

  class Validator
    def initialize(password, options = {})
      @password = password
      @options  = OpenStruct.new(DEFAULT_OPTIONS.merge(options))
    end

    def valid?
      true
    end

    def enough_length?
      @password.length.between?(@options.min_length, @options.max_length)
    end

    def has_uppercase?
      !!@password.match(/[A-Z]/)
    end

    def has_lowercase?
      !!@password.match(/[a-z]/)
    end
  end
end
