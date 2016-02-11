module ActiveModel::Validations
  class PasswordStrengthValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      validator = ::PasswordStrengthValidator::Validator.new(value, self.options)
      unless validator.valid?
        record.errors.add(attribute, :weak_password)
      end
    end
  end
end
