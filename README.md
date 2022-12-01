# MovinmotionApi
his gem allows you to access Movinmotion data for your account by adding your session cookie to the configuration.
Movinmotion API is not publicly open and this Gem uses visible access points from their website.
Please use carefully and respectfully.

## Usage
Install following below, then:
```bash
$ rails generate mm_initializer
```
Update initializer for your Movinmotion session cookie, decide if you want to use our classes (default true), and if you wqant to authorize writing on your movinmotion account (default false)

Use at your own risks!

This gem is still heavily in development and is not officially released at the moment.

If you keep the use of the classes, you have a few new ActiveRecord-like models:
- Mm::Position
- Mm::Project
- Mm::Ccn
- (more to come)

they respond to classic ActiveRecord messages. Please reach if you need more help on this.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "movinmotion_api"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install movinmotion_api
```

## Contributing
Please reach out!

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
