require 'spec_helper'

describe ActiveModel::Validations::PasswordStrengthValidator do
  shared_examples 'accepts strong password' do
    it 'accepts strong password' do
      model = test_class.new(password: password)
      expect(model).to be_valid
    end
  end

  shared_examples 'rejects weak password' do
    it 'rejects weak password' do
      model = test_class.new(password: password)
      expect(model).to_not be_valid
    end
  end


  describe '#validae_each' do
    context 'with default password validation' do
      let(:test_class) { TestDefaultValidationModel }

      context 'when password is strong enough' do
        let(:password)   { 'LongEnoughW1thNum83r' }
        include_examples 'accepts strong password'
      end

      context 'when password is too short' do
        let(:password)   { 'Sh0rt' }
        include_examples 'rejects weak password'
      end

      context 'when password is too long' do
        let(:password)   { 'Ab1' + 'a' * 72 }
        include_examples 'rejects weak password'
      end

      context 'when password does not include lowercase' do
        let(:password)   { 'WITH0UTLOSERCASE' }
        include_examples 'rejects weak password'
      end

      context 'when password does not include uppercase' do
        let(:password)   { 'with0utuppercase' }
        include_examples 'rejects weak password'
      end

      context 'when password does not include digit' do
        let(:password)   { 'WithOutAnyDigit' }
        include_examples 'rejects weak password'
      end
    end

    context 'with validation options' do
      let(:test_class) { TestValidateWithOptionModel }

      context 'when password is too short from given option' do
        let(:password)   { '123!@#Abc' }
        include_examples 'rejects weak password'
      end

      context 'when password does not include enough count of digits' do
        let(:password)   { 'NotEnoughdigits12!@#' }
        include_examples 'rejects weak password'
      end

      context 'when password does not include enough count of symbols' do
        let(:password)   { 'NotEnoughSymbols123!@' }
        include_examples 'rejects weak password'
      end

      context 'when password includes enough digits and symbols' do
        let(:password)   { 'EnoughSymbolAndDigits123!@#' }
        include_examples 'accepts strong password'
      end
    end
  end
end
