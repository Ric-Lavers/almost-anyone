# Almost Anyone

This rails app is a two sided marketplace that allows the users to act as both 'Tour Agent' and 'Promoter'.

As a MVP the app will ...

Minor version updates will add features such as ...

Major version updates will ....
___
## Gems

[devise](https://github.com/plataformatec/devise)

[rspec](https://github.com/rspec/rspec-rails)

[shrine](https://github.com/janko-m/shrine)

[aws](https://github.com/aws/aws-sdk-ruby)

[stripe](https://github.com/stripe/stripe-ruby)

[mail gun](https://github.com/mailgun/mailgun-ruby)

[impressionist](https://github.com/charlotte-ruby/impressionist)

[scoped_search](https://github.com/wvanbergen/scoped_search)

[guard-livereload](https://github.com/guard/guard-livereload)

## Elements


## Getting Started

```
rails new almost-anyone --skip test -d postgresql
```

1. **install devise** - using the Github guide
1. **install shrine** - using Github guide
  * **link ASW**
  * create profile scaffold

  ```
  rails g scaffold Profile user:reference brand:string  location:string phone_number:string image_data:text bio:text
  ```
1. **install rspec** - using Github guide
1. add first_name & last_name to User model with devise registration [github guide](https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address)
1. create Tour scaffold
    ```
    rails g scaffold Tour user:reference title:string  description:text country:string image_data:text bio:text start_date:timestamp end_date:timestamp min_cost:integer max_cost:integer

    rails db:migrate
    ```
1. create genre table.

```
    rails g model Genre name
    rails db:migrate

    rails g migration CreateJoinTableProfileGenre profile genre
    rails g migration CreateJoinTableTourGenre tour genre
      ```





These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system
## CHECK OUT THIS FOR MORE TIPS
* [Markdown-Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#lists) -This is intended as a quick reference and showcase.

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
