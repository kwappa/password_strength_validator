require 'spec_helper'

describe PasswordStrengthValidator::Validator do
  describe '#validae_each' do
    context 'with default password validation' do
      let(:test_class) { TestDefaultValidationModel }
      it 'accepts password with enough strength' do
        model = test_class.new(password: 'LongEnoughW1thNum83r')
        expect(model).to be_valid
      end
    end
  end
end
