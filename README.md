multilangs_experiment
=====================

This is Rails application example with multi languages supporting

Demo: http://murmuring-garden-1665.herokuapp.com/ (Globalize based version!)

### Backend part

* [I18n](https://github.com/svenfuchs/i18n) - Internationalization (i18n) library for Ruby(base infrastructure for validation messages, table names, field names, test in views, etc.)
rails-i18n(https://github.com/svenfuchs/rails-i18n) - standard Rails messages translated to different languages

#### Database/data localization:
 
* [globalize](https://github.com/tigrish/i18n-spec) - it uses additional table for each table with localized fields.
* [hstore_translate](https://github.com/robworley/hstore_translate) - it uses hstore key-value data type of Postgresql DB without additional tables 

### Web Interface for translators
It is based on LocalAapp - http://www.localeapp.com/projects/6998/
Test Translator: romikoops.1@gmail.com/test123

#### Workflow:
1. Edit the translations directly on the [multilangs_experiment](http://www.localeapp.com/projects/public?search=multilangs_experiment) project on Locale.
2. That's it!
3. The maintainer will then pull translations from the Locale project and push to Github.

**Note**: *Do not change config/locales/\*.yml files directly, it is not required in most cases. LocaleApp is doing the work by itself.*

### Client side part

* [i18n-js](https://github.com/fnando/i18n-js)

To actualize js locales(from LocaleApp):

```
  rake js:locales
```

It is good idea to include it to deployment script

### Locale Setting algorithm

```
 URL params > User Locale > Domain > HTTP headers > Default locale
``` 
 

I used [http_accept_language](https://github.com/iain/http_accept_language) gem for getting locale from HTTP headers.

### Testing

It is possible to limit locales count for testing. Put following line of code to config/environments/test.rb:

```ruby
 config.i18n.available_locales = [:en, :de]
``` 

Also, there is amazing [i18n-spec](https://github.com/tigrish/i18n-spec) gem