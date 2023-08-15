# README

Ruby 3.0.2 / Rails 7.0.6 / Vue3 / PostgresSQL 14

## Install

#### Clone the repository

```shell
git clone git@github.com:shalarn1/stepful-scheduler.git
cd stepful-scheduler
```
#### Ensure ruby version and bundler are installed
Download and install all of the Ruby gems (dependencies) in Gemfile.lock
```shell
bundle install
```
### Initialize the database
```shell
bundle exec rake db:create
bundle exec rake db:setup
```

### Start the rails server
Make sure postgres is running
```shell
bundle exec rails server
```

Go to http://localhost:3000 in your browser
