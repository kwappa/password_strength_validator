module ActiveModel::Validations
  class PasswordStrengthValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      validator = ::PasswordStrengthValidator::Validator.new(self.options)
      record.errors.add(attribute, 'invalid')
    end
  end
end
