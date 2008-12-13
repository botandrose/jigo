Jigo
============
_Version 0.1.1 (December 13, 2008)_

__Author:__  [Micah Geisel](mailto:originofstorms@gmail.com)

__Copyright:__  Copyright (c) 2008, Micah Geisel

__License:__  MIT License.  See LICENSE file for more details.

Jigo is a tiny web app for browsing your local gem rdocs. Its written using the [Sinatra](http://sinatrarb.com/) framework and the [Rack](http://rack.rubyforge.org/) middleware.

## Installation

	gem install sinatra rack
  
Extract a copy of Jigo into a directory of your choice, and run

	ruby app.rb

which will launch the app on port 4567, if you have mongrel installed. Or you may simply point a Rack-aware webserver at it. Personally, I am using Phusion Passenger to host it at jigo.local. 

Also, I am using mislav's [hanna](http://github.com/mislav/hanna/tree) rdoc template, so the rdocs will look best in Jigo if you use that as well.
