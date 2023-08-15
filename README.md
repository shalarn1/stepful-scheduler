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
### Add some data
```shell
bundle exec rails c
coaches, students = [], []
3.times do
  coaches << Coach.create!
  students << Student.create!
end
users = [
  { first_name: "Sophie", last_name: "H", role: coaches[0]},
  { first_name: "Juan", last_name: "C", role: coaches[1]},
  { first_name: "Mindy", last_name: "A", role: coaches[2]},
  { first_name: "Max", last_name: "Z", role: students[0]},
  { first_name: "Joy", last_name: "B", role: students[1]},
  { first_name: "Alex", last_name: "D", role: students[2]},
]
users.each do |user|
  User.create!(user)
end
```

### Start the rails server
Make sure postgres is running
```shell
bundle exec rails server
```

Go to http://localhost:3000 in your browser
