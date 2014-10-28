# motion-conf

_motion-conf_ is an easy to use configuration class generator for your RubyMotion apps. It uses YAML files to statically generate a `MotionConf` class with each option in the YAML file defined for easy access.

It uses the RubyMotion environment variable to determine which YAML file to compile into your application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'motion-conf'
```

## Usage

Possible files are:

 - config.development.yml
 - config.release.yml
 - config.test.yml
 - config.hockeyapp.yml
 - config.testflight.yml

_Each file should have the same YAML keys for consistency across builds._

If you had this in your yml file:

```yml
team: InfiniteRed
members: 7
email: info@infinitered.com
awesome: true
```
It would generate a class that looks like this:

```ruby
module MotionConf
  module_function

  def team; "InfiniteRed"; end;
  def members; 7; end;
  def email; "info@infinitered.com"; end;
  def awesome; true; end;
end
```

So you would access this anywhere in your code like so:

```ruby
def send_email
  send_email(to: MotionConf.email)
end
```

The auto-generated `config.rb` should be added to your `.gitignore` and _should not_ be added to your source control. It will be auto-generated every time you build the app, bringing in any changes you may have made to the YAML files.

## Todo

1. Write tests
2. Test in more environments
3. Support nested YAML values?

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
