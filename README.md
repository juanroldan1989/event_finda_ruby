<div align="left">
  <a href="https://github.com/juanroldan1989/event_finda_ruby"><img width="136" src="https://github.com/juanroldan1989/event_finda_ruby/raw/master/icons/icon.png" alt="eventfinda ruby logo" /></a>
</div>

# EventFinda Ruby
[![Gem Version](https://badge.fury.io/rb/event_finda_ruby.svg)](https://badge.fury.io/rb/event_finda_ruby)
[![Code Climate](https://codeclimate.com/github/juanroldan1989/event_finda_ruby/badges/gpa.svg)](https://codeclimate.com/github/juanroldan1989/event_finda_ruby)
[![Build Status](https://travis-ci.org/juanroldan1989/event_finda_ruby.svg?branch=master)](https://travis-ci.org/juanroldan1989/event_finda_ruby)
[![Coverage Status](https://coveralls.io/repos/github/juanroldan1989/event_finda_ruby/badge.svg?branch=master)](https://coveralls.io/github/juanroldan1989/event_finda_ruby?branch=master)

A Ruby client for the EventFinda API: www.eventfinda.co.nz

## Features

* Intuitive API interface navigation.
* Currently supports a variety of the API methods for `Events`, `Categories`, `Artists` and `Locations`  resources.
* Modular design allows for working with only parts of API you need.
* Fully tested with unit tests when applying filters and generating the final URL request.

## Installation

Install the gem by running

```ruby
gem install event_finda_ruby
```

or put it in your Gemfile and run `bundle install`

```ruby
gem "event_finda_ruby"
```

## 1. Usage

To start using the gem, you should get a developer account (free) from EventFinda's website: http://www.eventfinda.co.nz/api/v2/index

EventFinda will provide you with a `username/password` pair so you can use from now on.

Then create a new filter instance (in this example, to retrieve `Events`) like so:

```ruby
auth   = { username: "jhon", password: "123123abcabc" }
filter = EventFindaRuby::Events.new(auth)
```

and then call api methods, for instance, to filter `free` events:

```ruby
filter.by_free
```

or `featured` events:

```ruby
filter.by_featured
```

or `free` and `featured` events:

```ruby
filter.by_free.by_featured
```

Once applied all the filters you need, make the API call to get the events:

```ruby
filter.results
```

To see a full list of examples please check the <a href="https://github.com/juanroldan1989/event_finda_ruby/wiki">wiki</a> page.

## 2. Response
The response format is JSON by default. It can be changed to XML like this:

```ruby
filter.with_extension("xml")
```

Results are provided as an array of objects with the following structure (JSON):

```ruby
filter = EventFindaRuby::Events.new(auth)
filter.results
=> [
  { "id": 353192,
    "url": "http://www.eventfinda.co.nz/2016/resene-rainbow-run/new-plymouth",
    "url_slug": "2016/resene-rainbow-run/new-plymouth",
    "name": "Resene Rainbow Run: SOLD OUT",
    "presented_by": "",
    "description": "London, Glasgow, Sydney, Abu Dhabi, Melbourne, Queenstown, and now Taranaki! There's nothing else like it in Taranaki! Get together with your friends, family and colleagues to participate in Taranaki’s first ever ...",
    "datetime_start": "2016-04-10 11:00:00",
    "datetime_end": "2016-04-10 15:00:00",
    "location_summary": "Coastal Walkway, New Plymouth",
    "address": "New Plymouth Foreshore, New Plymouth",
    "is_free": false,
    "is_featured": true,
    "is_cancelled": false,
    "restrictions": "All Ages",
    "point": {
      "lat": -39.0594,
      "lng": 174.0513
    },
    "username": "lisarhx",
    "timezone": "Pacific/Auckland",
    "location": {...},
    "category": {...},
    "datetime_summary": "Sun 10 Apr",
    "sessions": {...},
    "ticket_types": {...},
    "artists": {...},
    "web_sites": {...},
    "images": {...}
  },..
]
```

For the sake of the example here, **location**, **category**, **sessions**, **ticket_types**, **artists**, **websites** and **images** keys contain more information related with the event that are not displayed above.

## 3. Modularity

This gem allow developers to query `Events`, `Artists`, `Categories` and `Locations` resources from the EventFinda API:

```ruby
filter = EventFindaRuby::Events.new(auth)
```

```ruby
filter = EventFindaRuby::Artists.new(auth)
```

```ruby
filter = EventFindaRuby::Categories.new(auth)
```

```ruby
filter = EventFindaRuby::Locations.new(auth)
```
## 4. Implementation
Setting up this gem to work is really easy. Even more if you use `has_scope` gem:

```ruby
class EventsController < ApplicationController

  has_scope :by_free,        as: :free,        type: :boolean
  has_scope :by_featured,    as: :featured,    type: :boolean
  has_scope :by_price_min,   as: :price_min
  has_scope :by_price_max,   as: :price_max
  has_scope :by_keywords_or, as: :keywords_or, type: :array

  helper_method :collection

  def index
  end

  private

  def collection
    @collection ||= events_filter.results
  end

  def events_filter
    @events_filter ||= apply_scopes(filter)
  end

  def filter
    @filter ||= EventFindaRuby::Events.new(auth)
  end
end
```

## 5. Work in progress

Current developments are focused on:

- `Artists`, `Categories` and `Locations` resources.
- Caching implementation when executing the same API request twice.
- API timeout handling scenarios.

## 6. Development

Questions or problems? Please post them on the [issue tracker](https://github.com/juanroldan1989/event_finda_ruby/github/issues). You can contribute changes by forking the project and submitting a pull request. You can ensure the tests are passing by running `bundle` and `rake`.

## 7. License

[MIT](http://opensource.org/licenses/MIT)
