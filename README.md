![Alt Text](http://imgur.com/pBy724o)

Words & Moves is a project I created to allow users to write reviews about music and arts, as well as post events relating to the former two. Users will then vote on the submitted content through a points system. It's esentially metacritic meets reddit along with the ability for users to post and vote with events as well. Users will have the ability to filter reviews and events through Trending, New, and All. The name of the project comes from lingo I frequently use with my friends:

###What's the word?

* meaning what's the scoop? or what's new?

This refers to the reviews for music, arts, and events happening in the DC area.

###What's the move?

* meaning what's going on? or what's the plan?

This refers to the upcoming events in the DC area.

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

## React and Rails Integration

I had the option of using react-rails, the official gem to integrate React with Rails but it would have lacked the ability to use Redux, Webpack, and React-Router. Therefore I plan on using the react\_on_rails gem which provides the ability to use the technologies the official gem lacks. This changes the original Rails architecture but I believe the benefits of having a hybrid, isomorphic web application outweighs the loss of certain rails components; In my opinion having a mix of server-side and client-side rendering is the future of web application.

This will be my first time working with React and Redux, along with integrating it with Rails, so I still don't know all the technical details on how I'm going to make this work but it should make for a great learning experience. I plan on using the extensive knowledge of google and of people I meet at meetups for any roadblocks I hit.

## Contributing

I'm still a newb by all means when it comes to software development. I've only worked on personal projects that were by no means very technical at all. This is one project that I could really use all the help I can get. Any comments and questions about my development process are more than welcome. If you have any experience in any of the above technologies and would like to contribute please send me an email so I can get you up to date on the development stage. Newbies are also welcomed, this should be a great learning experience for both you and I.

[Shoot me an email](mailto:me@devinosor.io)
