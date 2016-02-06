module PasswordStrengthValidator
  DEFAULT_OPTIONS = {
    min_length:  8,
    max_length: 12,
    require_uppercase: true,
    require_lowercase: true,
    number_of_digits:  1,
    number_of_symbols: 0,
  }.freeze

  class Validator
    def initialize(password, options = {})
      @password = password
      @options  = DEFAULT_OPTIONS.merge(options)
    end

    def valid?
      true
    end
  end
end
