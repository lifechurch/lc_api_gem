# The Lifechurch.tv API Ruby Gem

A Ruby wrapper for the Lifechurch.tv REST API

## Installation
```ruby
gem install lc_api
```

## Quick Start Guide
First, register your application with LifeChurch.tv at http://api.lifechurch.tv.

Then, copy and paste in your API Key.

```ruby
LcApi.key = "K690FKW924CKUCJTH94WK294WK029834SDFJ9862KSDF9234SDKF9421KDVDS"
```
Select Version by default it will be v1. You will need to set your version every model you extend from the LcApi Gem.
For example on the website we have Series Locations and Messages they all inherit from LcApi Gem everyone of those Models
has to have the version set IF you set it in one of them.
```ruby
LcApi::Base.set_api_version'v2'
```
Try finding a single resource:

```ruby
msg = LcApi::Message.find(1)
```

Try finding multiple resources:

```ruby
msg = LcApi::Message.find(:all)
```

Filter results:

```ruby
msg = LcApi::Message.find(1, :include => [:series, :speaker], :params => {quantity: 20, page: 2})
```

Access properties from the results:
```ruby
msg.title
msg.part
msg.length
msg.date_released
```

That's it, you're ready to rock!

## Configuration
You can configure both the API key and the base URI:

```ruby
LcApi.key = "K690FKW924CKUCJTH94WK294WK029834SDFJ9862KSDF9234SDKF9421KDVDS"
LcApi::Base.site = "http://0.0.0.0:3000/v1/"
```

## Usage Examples
All examples require an authenticated LifeChurch.tv consumer. See the <a href="#quick-start-guide">quick start</a> section above. 

**Get a message**

```ruby
LcApi::Message.find(1)
```

**Get all messages**

```ruby
LcApi::Message.find(:all)
```

**Get a message and include series and speakers**

```ruby
LcApi::Message.find(1, :include => [:series, :speaker])
```

**Get a message with include and quantity**

```ruby
LcApi::Message.find(1, :include => [:series, :speaker], :params => {quantity: 5})
```

**Get all messages with include, quantity, and page**
```ruby
LcApi::Message.all(:include => [:series, :speaker], :params => {quantity: 5, page: 2})
```

**Access properties on a message**
```ruby
msg.title
msg.part
msg.length
msg.date_released
```

**Access properties on a set of messages**
```ruby
msg = LcApi::Message.all
msg.each do |m|
  msg.title
  msg.part
end
```

## Resources

* LcApi::Location
* LcApi::Message
* LcApi::Series

## Filters

***Include***

  :include => [speaker,series]

***Quantity*** (for Message and Series only)

  :quantity => 5

***Page*** (for Message and Series only)

  :page => 2

## Coming Soon
* Link to API homepage
* Documentation Like to API
* More details on optional params (:includes, :quantity, etc.)

## Copyright
Copyright (c) 2014 LifeChurch.tv.
See [LICENSE][] for details.

[license]: LICENSE.txt