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
  end
end
