# README

- The Stack is
  - Rails
  - Sqlite3 (for development env)

# System dependencies

- Ruby version

  - ruby-3.0.1

* Rails version

  - 6.1.3 => 6.1.3.1

* Bundler version
  -2.2.16

# Running the application

Fork or clone this project to your machine navigate to the project directory

- run `bundle install` in your terminal

  - Bundler will run and install all required gems for running this application.

- Database initialization
  - run `rails db:setup` or `rake db:setup` to setup your database
  - run `rails db:migrate` or `rake db:migrate`
    - Migrations to the database will be run in order they were created
  - run `rails db:seed` to seed initial organization data

### Running the application

When all the previous steps are done: - run the server by typing `rails s` or `rails server` in your terminal. - Server will run at `:3000` portal and you will be able to visit application at: [localhost:3000]("http://localhost:3000/)

### Tests

- Application has some tests written and ready to run to run test:

- To run all tests navigate to /tests:
  - `cd test/`
  - run `bin/rails test test/`
- To run a specific test suit example controller test navigate to the desired controller:
  - `cd test/`
  - run `bin/rails test test/controllers`
- To run a specific controller test or any other test:
  - cd `test/`
  - run `bin/rails test test/controllers/desired_controller.rb`
  - If you want to specify starting line of test inside a file that you want to run add `:line_number` to the end of navigated file example:
    - `bin/rails test test/controllers/desired_controller:4` will run a test that starts at line `4`

# Mailer

Application has a setup for sending an email through Gmail services example: user password reset `token` to enable this navigate `application_controller.rb` file and change following:

- :address => 'smtp.gmail.com',
- :domain => 'mail.google.com',
- :port => 587,
- :user_name => `your.email@gmail.com`,
  - change this line to desired email you want to send tokens. Example: `noreply@application.com`
- :password => 'yourPassword',
  - #change this line to your email password
- :authentication => 'login',
- :enable_starttls_auto => true

# Ruby version

To check your current ruby version: run `ruby -v` in your terminal

- In case your ruby version is outdated you can install the new version by running ` brew install ruby` if you are using Homebrew or with RVM
- `rvm install ruby-3.0.1`
- `rvm --default use ruby-3.0.1`

In case you do not have RVM installed follow this great tutorial:

- [rvm installation](https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/install_language_runtime.html)

# Errors

- In case of `Webpacker::Manifest::MissingEntryError in Devise::Sessions #new ERROR` when trying to run server with `rails server` run this command in your terminal:

  - `bundle exec rails webpacker:install`

- Bundler version not compatible or outdated:

  - run `gem install bundler`
  - [Bundler documentation](https://bundler.io/)

- Rails version not compatible or outdated:
  - [Rails documentation](https://github.com/rails/rails)
