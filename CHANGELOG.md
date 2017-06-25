# Change log

## [v0.3.4] - 2017-06-25

### Changed
* "HTTParty" ruby gem version updated to "0.15.5".

## [v0.3.3] - 2017-01-08

### Changed
* Ruby version bumped up from "1.9.3" to "2.1.2".
* Gems updated to latest versions: "coveralls", "httparty", "rake", "vcr" and "webmock".
* Gemfile updated accordingly.
* Gemspec file updated accordingly.
* Test suite: HTTP responses from EventFinda API updated in VCR cassettes properly.

## [v0.3.1] - 2016-05-09

### Added
* Ruby versions setup: "1.9.3" and "2.1.2".

## [v0.3.0] - 2016-04-25

### Added
* "Configuration" module setup to provide ".configure" method as part of public gem API.
* Gem's ".configure" method can be implemented within an initializer file.
* Tests added for "Configuration" module.

### Changed
* All 4 resources implement "Configuration" module.
* All tests have been updated to comply with this implementation.

## [v0.2.8] - 2016-04-12

### Added
* "webmock" / "vcr" gems implemented to store real API responses.
* "Events", "Artists", "Categories" and "Locations" resources: "#results" instance method tested with API real results stored via "vcr" gem.

### Changed
* Gem's description.

## [v0.2.7] - 2016-04-10

### Changed
* "results" instance method moved into Base class.
* RESOURCE_SLUG constant implemented to reduced logic around URL request.

## [v0.2.6] - 2016-04-10

### Added
* "Locations" resource: filters added. Tests added.

## [v0.2.5] - 2016-04-10

### Changed
* Base module: BASE_URL constant removed.
* "Locations" resource added. Tests added.

## [v0.2.4] - 2016-04-09

### Changed
* Base module: filters appliance logic implemented through hashes. Cleaner and simpler.
* API extension defined properly inside URL.

## [v0.2.3] - 2016-04-09

### Changed
* Base module: "with_extension" method returns an object like every other method.

## [v0.2.2] - 2016-04-09

### Added
* Requests can be performed to interact with "Categories" resource.

## [v0.1.2] - 2016-04-09

### Added
* Requests can be performed to interact with "Artists" resource.

## [v0.0.2] - 2016-04-09

### Changed
* Common API methods moved into "Base" module to be shared between all resources.

## [v0.0.1] - 2016-04-09

### Added
* Initial release :)
* Requests can be performed to interact with "Events" resource.
