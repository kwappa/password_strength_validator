require 'spec_helper'

describe PasswordStrengthValidator::Validator do
  let(:password)  { '' }
  let(:options)   { {} }
  let(:validator) { described_class.new(password, options) }

  describe '#enough_length?' do
    context 'when blank' do
      specify { expect(validator).to_not be_enough_length }
    end

    context 'when too short' do
      let(:password) { 'short' }
      specify { expect(validator).to_not be_enough_length }
    end

    context 'when decent length' do
      let(:password) { 'decent_length' }
      specify { expect(validator).to be_enough_length }
    end

    context 'when too long' do
      let(:password) { 'P' * 73 }
      specify { expect(validator).to_not be_enough_length }
    end
  end

  describe '#has_uppercase?' do
    context 'only lowercase' do
      let(:password) { 'onlylowercase' }
      specify { expect(validator).to_not be_has_uppercase }
    end

    context 'only uppercase' do
      let(:password) { 'ONLYLUPPERCASE' }
      specify { expect(validator).to be_has_uppercase }
    end

    context 'with mixed case' do
      let(:password) { 'MixedCasePassword' }
      specify { expect(validator).to be_has_uppercase }
    end

    context 'without validation' do
      let(:password) { 'onlylowercase' }
      let(:options)  { { require_uppercase: false } }
      specify { expect(validator).to be_has_uppercase }
    end
  end

  describe '#has_lowercase?' do
    context 'only lowercase' do
      let(:password) { 'onlylowercase' }
      specify { expect(validator).to be_has_lowercase }
    end

    context 'only uppercase' do
      let(:password) { 'ONLYLUPPERCASE' }
      specify { expect(validator).to_not be_has_lowercase }
    end

    context 'with mixed case' do
      let(:password) { 'MixedCasePassword' }
      specify { expect(validator).to be_has_lowercase }
    end

    context 'without validation' do
      let(:password) { 'ONLYUPPERCASE' }
      let(:options)  { { require_lowercase: false } }
      specify { expect(validator).to be_has_lowercase }
    end
  end

  describe '#has_enought_digits?' do
    context 'without any digits' do
      let(:password) { 'LongEnoughtWithoutDigits' }
      specify { expect(validator).to_not be_has_enough_digits }
    end

    context 'with enough one digits' do
      let(:password) { 'LongEnoughtWith1Digits' }
      specify { expect(validator).to be_has_enough_digits }
    end

    context 'with not enough digits' do
      let(:options) { { number_of_digits: 4 } }
      let(:password) { '3isNotEnough' }
      specify { expect(validator).to_not be_has_enough_digits }
    end

    context 'without validation' do
      let(:password) { 'WithOutAnyDigits' }
      let(:options)  { { number_of_digits: 0 } }
      specify { expect(validator).to be_has_enough_digits }
    end
  end

  describe '#has_enough_symbols?' do
    context 'without any symbols' do
      let(:password) { 'LongEnoughtWithoutSymbols' }

      context 'and default options' do
        specify { expect(validator).to be_has_enough_symbols }
      end

      context 'and custom options' do
        let(:options) { { number_of_symbols: 1 } }
        specify { expect(validator).to_not be_has_enough_symbols }
      end
    end

    context 'with two symbols' do
      let(:password) { '!LongEnoughtWith_TwoSymbols|' }
      let(:options) { { number_of_symbols: 2 } }
      specify { expect(validator).to be_has_enough_symbols }
    end
  end
end
