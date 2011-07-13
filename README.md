# Description

Returns JSON of requested IP.  Supports callback via "callback" GET param

# Production Example

## Set ENV["ALLOWED_HOSTS"]

Heroku Example:

    heroku config:add ALLOWED_HOSTS=http://mydomain.com/,http://myotherdomain.com

## Make request

Example:

    http://my-copy-of-jsonip.com/

returns...

    {"ip":"92.168.148.123"}


## Supports JSONP via "callback param"

Example:

    http://my-copy-of-jsonip.com/?callback=my_js_function

returns...

    my_js_function({"ip":"92.168.148.123"});


### jQuery usage example:

    $.getJSON("http://my-copy-of-jsonip.com/?callback=?",
      function(data){
        alert("Your IP is: " + data.ip);
      }
    );

# Development

To start the app:

    bundle exec shotgun

Example request:

    http://localhost:9393/

(a local "ALLOWED_HOSTS" ENV is not necessary as it allows all requests in development mode)

# Contributing

In the spirit of [free software](http://www.fsf.org/licensing/essays/free-sw.html), **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (**no patch is too small**: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by resolving issues
* by reviewing patches