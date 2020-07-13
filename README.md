# README
## open_kitchen
* Pair Project
  Chan https://github.com/thechanmoon/ &
  SpncerBlum https://github.com/SpencerBlum
* Clone the repository

```shell
https://github.com/thechanmoon/oepn_kitchen.git
https://github.com/SpencerBlum/open_kitchen.git
cd open_kitchen
```

* Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.6.1`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

* Ruby version
  ruby '2.6.1'

* Built With
  Ruby on Rails - The Ruby web framework

* System dependencies
  Using [Bundler](https://github.com/bundler/bundler)
```shell
bundle install
rails webpacker:install
```
* Database creation
```shell
rails db:create
```
* Database initialization
```shell
rails db:migrate db:seed
```

* Run
You may run server either by bin/rails s and bin/webpack-dev-server OR the provided binstub ./bin/serve command.
```shell
bin/rails s
and bin/webpack-dev-server
or ./bin/serve
```


* How to run the test suite
```shell
bundle exec rspec
```
* Services (job queues, cache servers, search engines, etc.)

* Deployment
Project is deployed in Heroku https://open-kitchen-snc.herokuapp.com
* ...