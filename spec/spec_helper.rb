require 'rubygems'
require 'rspec'
require 'active_model'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'password_strength_validator'

class TestModel
  include ActiveModel::Validations

  def initialize(attributes = {})
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end
end

class TestDefaultValidationModel < TestModel
  validates :password, password_strength: true
end

class TestValidateWithOptionModel < TestModel
  validates :password, password_strength: { min_length: 12, number_of_digits: 3, number_of_symbols: 3 }
end
