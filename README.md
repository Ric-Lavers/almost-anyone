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
then add below to the form

```
<div class="field">
  <%= form.label :genres %>
  <%= form.collection_select(:genres, Genre.order(:name),:id,:name,{}, {multiple: true, include_blank: false}) %>
</div>
```
Now the form will look to the Genres to find the selection and send the :id and :name to the controller in the *weak* params. After the new Tour or Profile is made add the below code to link the genres via the join table.

```
temp_genres = params[:tour][:genres]
temp_genres.each{|genre_id|
  @tour.genres << Genre.find(genre_id) unless genre_id.blank?
}
```
### Calendar Model

The custom calendar model uses a number of methods to display the Tour date range as either a week summary or total days, it also displays the booked days

**Calendar.new(start_date, end_date)** - Creates a new calendar object with

##### *methods*

**createCalendar**  - creates a calendar array stored as @cal

**bookDays(*days)** - alters the @cal array to include true and false (available and booked) booleans

**displayCalendar** - outputs the @cal array as html for the calendar Sunday to Monday, with project css appropriate class tags (note: that .html_safe rails method needs to be added)

**displayWeek**     - outputs the @cal array as html for the week Sunday to Thursday, Friday, Saturday, with project css appropriate class tags (note: that .html_safe rails method needs to be added). These with entertainment bookings the most common day to book is Fridays and Saturdays.

### bookings

```
rails g scaffold Booking tour:references date:timestamp
rails db:migrate
```
change routes to nest booking in tours


Make the rating model
```
 rails g model Rating profile:references user:references score:integer
```
in ```db/migrate/<the new migration> ``` add default to 0 to score ```t.integer :score, default: 0```

```
<!-- below is a way to get a searchable dropdown menu-->
      <!-- <div class="field">
        <input type=text list=browsers name="genre">
          <datalist id=browsers >
            <%Genre.all.each do |g|%>
             <option> <%=g.name%>
            <%end%>
          </datalist>
      </div> -->
```



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
```

## Deployment

Add additional notes about how to deploy this on a live system
