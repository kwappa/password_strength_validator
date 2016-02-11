# PasswordStrengthValidator

[![Build Status](https://travis-ci.org/kwappa/password_strength_validator.svg?branch=master)](https://travis-ci.org/kwappa/password_strength_validator)

validates strength of password with ActiveRecord

## Usage

- with default options
  - require 8 - 72 characters
  - require both uppercase and lowercase
  - require 1 or more digtis

```
class TestModel < ActiveRecord::Base
  validates :password, password_strength: true
end
```

- add extra option for more strength
  - require 12 - 72 characters
  - require 3 or more digits
  - require 3 or more symbols

```
class StrongTestModel < ActiveRecord::Base
  validates :password, password_strength: { min_length: 12, number_of_digits: 3, number_of_symbols: 3 }
end
```

- acceptable symbols:

```
!@"#$%&'()*+,-./:;<=>?[\]^_`{|}~
```

- custom error message

to cusotomize error message, specify your local file with key:

`#{lang}.errors.messages.weak_password`

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
