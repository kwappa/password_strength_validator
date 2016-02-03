require 'spec_helper'

describe PasswordStrengthValidator::Validator do
  subject(:test_model) { TestModel.new }
  context 'first test' do
    specify { expect(test_model).to be_valid }
  end
end
