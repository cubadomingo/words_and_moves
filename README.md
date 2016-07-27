![Alt Text](http://i.imgur.com/pBy724o.png)

[![Build Status](https://travis-ci.org/cubadomingo/words_and_moves.svg?branch=master)](https://travis-ci.org/cubadomingo/words_and_moves)
[![Coverage Status](https://coveralls.io/repos/github/cubadomingo/words_and_moves/badge.svg?branch=master)](https://coveralls.io/github/cubadomingo/words_and_moves?branch=master)

Words & Moves is a web application that takes the concept of user submitted content and using a voting system to rank it and filter it through hot, new, top, and rising. Users can create posts and comment on the posts relating to the arts. I was inspired to create this website after visiting a couple of cities over differrent countries and seeing how there was no website for all cities that was constantly updated with events that are happening in the region. Events are also votable and follow the same concept of posts and comments.

###What's the word?

* meaning "what's the scoop?" or "what's new?"

This refers to the posts for music, films, and arts happening in the DC area.

###What's the move?

* means "what's going on?" or "what's the plan?"

This refers to the upcoming events happening in the region.

## What's the Stack?


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

## Database Schema

The current schema as of now looks like this:
![Alt Text](http://i.imgur.com/rBCsQua.png)

We're still pretty early in the development stage and there are still much more features that have yet to be added to the schema.

## React and Rails Integration

I had the option of using react-rails, the official gem to integrate React with Rails but it would have lacked the ability to use Redux, Webpack, and React-Router. Therefore I plan on using the react\_on_rails gem which provides the ability to use the technologies the official gem lacks. This changes the original Rails architecture but I believe the benefits of having a hybrid, isomorphic web application outweighs the loss of certain rails components; In my opinion having a mix of server-side and client-side rendering is the future of web application.

We're still on the fence on wether we use react for all view components or only for certain client side features while maintaining the traditional ERB views for certain pages instead of using React for both. Stay tuned as we could go either way.

## Contributing

I'm still a newb by all means when it comes to software development. I've only worked on personal projects that were by no means very technical at all. This is one project that I could really use all the help I can get. Any comments and questions about my development process are more than welcome. If you have any experience in any of the above technologies and would like to contribute please send me an email so I can get you up to date on the development stage. Newbies are also welcomed, this should be a great learning experience for both you and I.

[Shoot me an email](mailto:me@devinosor.io)
