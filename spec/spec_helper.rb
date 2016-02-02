require 'rubygems'
require 'rspec'
require 'active_model'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'password_strength_validator'

class TestModel
  include ActiveModel::Validations
end
