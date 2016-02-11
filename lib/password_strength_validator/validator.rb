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

  SYMBOLS = %w[!@"#$%&'()*+,-./:;<=>?[\\]^_`{|}~].first.unpack('C*').freeze

  class Validator
    def initialize(password, options = {})
      @password = password
      @options  = OpenStruct.new(DEFAULT_OPTIONS.merge(options))
    end

    def valid?
      enough_length? && has_uppercase? && has_lowercase? && has_enough_digits? && has_enough_symbols?
    end

    def enough_length?
      @password.length.between?(@options.min_length, @options.max_length)
    end

    def has_uppercase?
      !@options.require_uppercase || !!@password.match(/[A-Z]/)
    end

    def has_lowercase?
      !@options.require_lowercase || !!@password.match(/[a-z]/)
    end

    def has_enough_digits?
      @password.each_char.grep(/[0-9]/).size >= @options.number_of_digits
    end

    def has_enough_symbols?
      @password.each_char.map(&:ord).select { |c| SYMBOLS.include?(c) }.size >= @options.number_of_symbols
    end
  end
end
