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
    def initialize(options = {})
      @options = DEFAULT_OPTIONS.merge(options)
    end
  end
end
