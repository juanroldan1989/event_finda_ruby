<div align="center">
  <a href="https://github.com/juanroldan1989/event_finda_ruby"><img width="136" src="https://github.com/juanroldan1989/event_finda_ruby/raw/master/icons/icon.png" alt="eventfinda ruby logo" /></a>
</div>

# EventFinda Ruby
[![Code Climate](https://codeclimate.com/github/juanroldan1989/event_finda_ruby/badges/gpa.svg)](https://codeclimate.com/github/juanroldan1989/event_finda_ruby)
[![Build Status](https://travis-ci.org/juanroldan1989/event_finda_ruby.svg?branch=master)](https://travis-ci.org/juanroldan1989/event_finda_ruby)

A Ruby client for the EventFinda API: www.eventfinda.co.nz

## Features

* Intuitive API interface navigation.
* Currently supports a variety of the API methods for 'Events' resource. It's built in a modular way.
* Modular design allows for working with parts of API.
* Fully tested with unit tests when generating the final URL request.

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

or events with `prices` between $25 and $50:

```ruby
filter.by_price_min(25).by_price_min(50)
```

or events starting on `2016-05-22` and finishing `2016-10-28`:

```ruby
filter.by_start_date("2016-05-22").by_end_date("2016-10-28")
```

or events containing `any` of these keywords `["fun", "cinema", "outdoor"]`:

```ruby
filter.by_keywords_or(["fun", "cinema", "outdoor"])
```

or events containing `all` of these keywords `["beach", "music", "free"]`:

```ruby
filter.by_keywords_and(["beach", "music", "free"])
```

or if you like to setup your `own keywords logic`:

```ruby
filter.by_query("(fun+AND+music+AND+beach)+OR+beach")
```

By default, API is returning `20 events tops` on each request. Less events can be retrieved like this:

```ruby
filter.by_rows(15)
```

Once applied all the filters you need, make the API call to get the events:

```ruby
filter.results
```

Same logic explained above can be extended to the rest of the filters defined here: http://www.eventfinda.co.nz/api/v2/events

## 2. Response
Results are provided as an array of objects with the following structure:

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

This gem allow developers to query 'Events' resources from the EventFinda API (work in progress for Artists, Categories and Locations):

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

## 4. Work in progress

Current developments are focused on:

- `Artists`, `Categories` and `Locations` resources.
- Caching implementation when executing the same API request twice.
- API timeout handling scenarios.

## 5. Development

Questions or problems? Please post them on the [issue tracker](https://github.com/juanroldan1989/event_finda_ruby/github/issues). You can contribute changes by forking the project and submitting a pull request. You can ensure the tests are passing by running `bundle` and `rake`.

## 6. License

[MIT](http://opensource.org/licenses/MIT)
