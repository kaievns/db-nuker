# DB Nuker

Faster database cleaner for _MySQL_

## Usage

1) Add it your gemfile

```ruby
gem 'db-nuker'
```

2) Create file `spec/support/db_nuker.rb`

```ruby
RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DBNuker.boom!
  end

  config.after(:each) do
    DBNuker.boom!
  end
end
```

3) Enjoy!

## How Does It Work?

Pure magic!

## No, Really?

It cleans only those tables that have records in them

## Known Caveates

Doesn't reset the tables auto-increments. Well, you shouldn't rely
on certain IDs in your tests anyways.


## License & Copyright

All code in this repository is released under the terms of the MIT license

Copyright (C) 2014 Nikolay Nemshilov
