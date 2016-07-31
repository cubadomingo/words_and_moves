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
    - [Back  End](#back-end)
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
- [Navigation](#navigation)

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
       - Arlintgon (**City**)
       - Etc.

Within these cities are **Users** who will be able to create **Events** happening in the region as well as discussion **Posts**. The events and posts fall under a **Category**. A user has the ability to **RSVP** to any events along with the ability to **Like** or **dislike** any post or event. The ratio of votes (59 likes, 10 dislikes, e.g.) and time posted at, will be the deciding factor in filtering Posts and Events by *Hot*, *New*, and *Rising*. Users will also be able to **Comment** on the event and discussion postings.

Users will have a feed page once they are logged in where they will be able to view their regions's category's events and posts by default. They will have the ability to **subscribe to other regions** which will add that region's posting and events to the user's feed.

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

### Tools

## Features
All models have a timestamp which will not be inculded in this reference.
### Regions
- Columns
   - region_id (primary key)
   - name

### Subregions
- Columns
   - subregion_id (primary key)
   - region_id (foreign key)
   - name

### Cities
- Columns
   - city_id (primary key)
   - subregion_id (foreign key)
   - name

We are currently only including primary cities.
### Users
- Columns
   - user_id (primary key)
   - email
   - password
   - admin
   - username
   - first_name
   - last_name

*For the sake of keeping the list short Devise attributes have been ommited.*

Users will also have the ability to sign in with Oauth authentication through Facebook & Google (**Not Implemented Yet**). Users have all features that Devise includes.

### Categories
- Attributes
   - category_id (primary key)
   - name (string)

Current categories include: Music, Art, Sports, Films. These categories can change and more than likely will. Regular users can not create categories only Admin Users.

### Events
- Attributes
   - event_id (primary key)
   - category_id (foreign key)
   - city_id (foreign key)
   - title (string)
   - body (text)
   - location **REMOVE FROM SCHEMA**
   - event_date (datetime)
 
### RSVPs
- Attributes
   - rsvp_id (primary_key)
   - event_id (foreign key)
   - user_id (foreign key)

### Posts
- Attributes
   - post_id (primary key)
   - category_id (foreign key)
   - region_id (foreign key)
   - title (string)
   - body (text)

### Comments
- Attributes
   - comment_id (primary key)
   - user_id (foreign key)
   - event_id (foreign key)
   - post_id (foreign key)
   - body (string)
 
Include all CRUD functions for regular users and also gives the admin user the ability to remove comments.

### Likes
- Attributes
   - like_id (primary key)
   - user_id (foreign key)
   - item_type (string)
   - item_id (integer)
 
**Ask Thomas for clarification on this section**

### Dislikes
- Attributes
   - dislike_id (primary key)
   - user_id (foreign key)
   - item_type (string)
   - item_id (integer)

**Ask Thomas for clarification on this section**

### Subscribers
- Attributes
   - subscriber_id (primary key)
   - email (string)

Currently visitors of the site can subscribe and receive an email when the website goes live. This feature can possible be removed after the release.

### User_Region_Relations
- Attributes
   - user_region_relation_id (primary key)
   - user_id (foreign key)
   - city_id (foreign key)

Users can subscribe to regions to receive that regions events and posts in their feed. This is handy for people living in between two regions (Los Angeles & San Francisco, e.g.) or constantly traveling
### User_City_Relations
**I don't think a user should be able to subscribe to a city but rather only a region**

## Schema
![Alt Text](http://i.imgur.com/rBCsQua.png)

Here is a visual representation of our Schema
**Update This**


## Components
For the time being all components are being made in traditional rails erb views. Once we have a good enough outline and idea we will start incorporating React components into the views.

## Navigation

### Landing Page (Temporary Root)

This is a landing page for visitors to Subscribe and receive a notification when the site is live.

### Explore (Root after including other regions)

This page will have a list of different regions to choose from. **No plans of implementation yet**

### Devise

This includes all the devise views:
- sign up
- sign in
- forgot password
- email activation
- user settings

### User Feed 

This page has the events and posts from the users subscribed regions. Currently it will default to the DC individual region page.

### Individual Event

This is the page for an individual event, comments are shown here. The right side bar should have a list of other posts/events in the region or subscribed feed if the User is signed in.

### Individual Post

This is the page for an individual post, comments are shown here. The right side bar should have a list of other posts/events in the region or subscribed feed if the User is signed in.

### Individual Region (Root after launch)

This page will have a subscribe button (**Only after regions > 1 else sign in / sign up button**) which will allow signed in users to add the region to their user feed page. If the user is signed out, he should be redirected to the sign in page. This region page will look like the user feed page.

### All Regions Page (**No plans for implementation yet**)

This page will show all the regions posts and events.
