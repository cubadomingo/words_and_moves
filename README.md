![Alt Text](http://i.imgur.com/pBy724o.png)

[![Build Status](https://travis-ci.org/cubadomingo/words_and_moves.svg?branch=master)](https://travis-ci.org/cubadomingo/words_and_moves)
[![Coverage Status](https://coveralls.io/repos/github/cubadomingo/words_and_moves/badge.svg?branch=master)](https://coveralls.io/github/cubadomingo/words_and_moves?branch=master)

Words & Moves is conjunction of two popular phrases that I use with friends. They are:

### What's the word?

* meaning "what's the scoop?" or "what's new?"

### What's the move?

* means "what's going on?" or "what's the plan?"

Words & Moves is an application for users to submit events and posts happening in their region. The community can vote and comment on the submissions as well as use other site actions. Please see the [Features](##Features) section of the Development Outline to see all the currently planned features.

# Notes

- If you are interested in contributing please familiarize yourself with the development outline further down the page. We try and do good job of consistenlty tracking our development progress and added functionality/features. 
- Afterwards checking the [Issues](https://github.com/cubadomingo/words_and_moves/issues) is a great place to start contributing.
- If you have any feedback or questions you can send us an [email](mailto:me@devinosor.io).

# Development Outline

- [Introduction](#introduction)
- [Technology](#technology)
    - [Back End](#back-end)
    - [Front End](#front-end)
    - [Testing](#testing)
    - [Gems](#gems)
    - [Tools](#tools)
- [Features](#features)
    - [Regions](#regions)
    - [Subregions](#subregions)
    - [Cities](#cities)
    - [Users](#users)
    - [Categories](#categories)
    - [Events](#events)
    - [RSVPs](#rsvps)
    - [Posts](#posts)
    - [Comments](#comments)
    - [Likes](#likes)
    - [Dislikes](#dislikes)
    - [Subscribers](#subscribers)
    - [User_Region_Relations](#user_region_relations)
- [Schema](#schema)
- [Components](#components)
- [Navigation & Routes](#navigation--routes)

## Introduction
This application will be location based. Each **Region** will have **Subregions** which is made of principal **Cities**. 

- Washington Metropolitan Area (**Region**)
    - Washington D.C. (**Subregion**)
       - Washington D.C. (**City**)
    - Southern Maryland (**Subregion**)
       - Bethesda (**City**)
       - Silver Spring (**City**)
       - Etc.
    - Northern Virginia (**Subregion**)
       - Alexandria (**City**)
       - Arlington (**City**)
       - Etc.

Within these cities are **Users** who will be able to create **Events** happening in the region as well as discussion **Posts**. The events and posts fall under a **Category**. A user has the ability to **RSVP** to any events along with the ability to **Like** or **dislike** any post or event. The ratio of votes (59 likes, 10 dislikes, e.g.) and time posted at, will be the deciding factor in filtering Posts and Events by *Hot*, *New*, and *Rising*. Users will also be able to **Comment** on the event and discussion postings.

Users will have a feed page once they are logged in where they will be able to view by default their regions's category's events and posts. They will have the ability to **subscribe to other regions** which will add that region's posting and events to their feed.

## Technology

### Back-End

* VPS: **DigitalOcean**
* OS: **Ubuntu Trusty Tahr**
* Database: **PostgreSQL**
* Web Server: **NGINX**
* App Server: **Passenger Phusion**
* Deployment Automation: **Capistrano**
* Scripting Language: **Ruby**
* Web Framework: **Ruby on Rails**

### Front-End

* Structure: **HTML5 & Javascript(ES6)**
* Design: **CSS3 & Sass**
* Responsive Framework: **Bootstrap**
* Javascript Library: **ReactJS**
* State Container: **Redux**
* Module Bundler: **Webpack**

### Testing

* Rails Framework: **RSpec**, **Capybara**
* React Framework: **Jest**
* Tools: **Shoulda Matchers**, **factory_girl**

### Gems

* development
   - bootstrap-sass
   - react_on_rails
   - annotate
   - devise
   - coveralls
   - capistrano (nvm, passenger, rails, rvm, npm)
* testing
   - shoulda-matchers
   - rspec-rails
   - factory_girl-rails
   - dotenv-rails
   - capybara
   - database_cleaner

### Tools

* Travis CI
* Coveralls

## Features
All models have a timestamp which will not be inculded in this reference.

### Regions
- Attributes
   - region_id (primary key)
   - name

```
has_many :subregions
has_many :posts
has_many :events

has_many :user_region_relations
has_many :users, through: :user_region_relations
```

### Subregions
- Attributes
   - subregion_id (primary key)
   - region_id (foreign key)
   - name

```
belongs_to :region

has_many :cities
has_many :events, through: :cities
```

### Cities
- Attributes
   - city_id (primary key)
   - subregion_id (foreign key)
   - name

```
belongs_to :subregion
has_many :events

has_many :user_city_relations
has_many :users, through: :user_city_relations
```

We are currently only including primary cities.
### Users
- Attributes
   - user_id (primary key)
   - email
   - password
   - admin
   - username
   - first_name
   - last_name

*For the sake of keeping the list short Devise attributes and associations have been ommited.*

```
has_many :comments
has_many :posts
has_many :events

has_many :rsvps
has_many :rsvped_events, through: :rsvps, source: :event

has_many :likes
has_many :liked_events, through: :likes, source: :event

has_many :dislikes
has_many :disliked_events, through: :dislikes, source: :event

has_many :likes
has_many :liked_posts, through: :likes, source: :post

has_many :dislikes
has_mnay :disliked_posts, through: :dislikes, source: :post

has_many :user_city_relations
has_many :pregerred_cities, through: :user_city_relations, source: :city

has_many :user_region_relations
has_many :preferred_regions, through: :user_region_relations, source: :region
```

Users will also have the ability to sign in with Oauth authentication through Facebook & Google (**Not Implemented Yet**). Users have all features that Devise includes.

### Categories
- Attributes
   - category_id (primary key)
   - name (string)

```
has_many :posts
has_many :events
```

### Events
- Attributes
   - event_id (primary key)
   - category_id (foreign key)
   - city_id (foreign key)
   - title (string)
   - body (text)
   - location **REMOVE FROM SCHEMA**
   - event_date (datetime)
 
```
belongs_to :category
belongs_to :user
belongs_to :city
has_many :comments
has_many :rsvps
has_many :likes, as: :item
has_many :dislikes, as: :item
has_many :users, through: :rsvps
```

### RSVPs
- Attributes
   - rsvp_id (primary_key)
   - event_id (foreign key)
   - user_id (foreign key)

```
belongs_to :user
belongs_to :event
```

### Posts
- Attributes
   - post_id (primary key)
   - category_id (foreign key)
   - region_id (foreign key)
   - title (string)
   - body (text)

```
belongs_to :region
belongs_to :user
belongs_to :category
has_many :comments
has_many :likes, as: :item
has_many :dislikes, as: :item
```

### Comments
- Attributes
   - comment_id (primary key)
   - user_id (foreign key)
   - event_id (foreign key)
   - post_id (foreign key)
   - body (string)
 
```
belongs_to :post
belongs_to :event
belongs_to :user
```

### Likes
- Attributes
   - like_id (primary key)
   - user_id (foreign key)
   - item_type (string)
   - item_id (integer)
 
```
belongs_to :user
belongs_to :item, polymorphic: true
```

**Ask Thomas for clarification on this section**

### Dislikes
- Attributes
   - dislike_id (primary key)
   - user_id (foreign key)
   - item_type (string)
   - item_id (integer)

```
belongs_to :user
belongs_to :item, polymorphic: true
```

### Subscribers
- Attributes
   - subscriber_id (primary key)
   - email (string)

```
belongs_to :region
has_many :cities
has_many :events, through: :cities
```

### User_Region_Relations
- Attributes
   - user_region_relation_id (primary key)
   - user_id (foreign key)
   - city_id (foreign key)

```
belongs_to :user
belongs_to :region
```

### User_City_Relations
**I don't think a user should be able to subscribe to a city but rather only a region**

## Schema
![Alt Text](http://i.imgur.com/rBCsQua.png)

Here is a visual representation of our Schema
**Update This**


## Components

For the time being all components are being made in traditional rails erb views. Once we have a good enough outline and idea we will start incorporating React components into the views.

## Navigation & Routes

Here is the routing for how the application will be, I am only showing the *read* views. Views for *creating*, *updating*, and *destroying* have not been established yet.

### / (Root)

The current root is a subscribe page for visitors to enter their email and be notified when the site is live.

### /explore (Root after including other regions)

This page will have a list of different regions to choose from and then redirect to their respective feed.

### Devise urls

This includes all the devise views: urls have yet to be customized.

### /feed

This page has the events and posts from the users subscribed regions. Currently it will default to the DC individual region page, a user will then be able to subscribe to other regions once they are added.

### /washingtondc/feed

This page will be the feed for an individual region. The region's posting and events will be here.

### /washingtondc/event/joey-badass-at-the-howard-theater

This is the page for an individual event, comments are shown here. The right side bar should have a list of other posts/events in the region or subscribed feed if the User is signed in.

### /washingtondc/event/new

This is the page for creating a new event.

### /washingtondc/event/edit

This is the page for editing an event.

### /washingtondc/post/nwa-begginer-guide

This is the page for an individual post, comments are shown here. The right side bar should have a list of other posts/events in the region or the user's subscribed feed if the User is signed in.

### /washingtondc/post/new

This is the page for creating a new post.

### /washingtondc/post/edit

This is the page for editing a post.

### /feed/all

This page will show posts and events for all the regions in our database.
