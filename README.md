[![CircleCI](https://circleci.com/gh/blinkist/blinkist-core.svg?style=svg&circle-token=dd9f2dcbafb363324e182d7efb2f160d4dcd6bd6)](https://circleci.com/gh/blinkist/blinkist-core)
[![Dependency Status](https://www.versioneye.com/user/projects/51dc359a7c1df6000200bc60/badge.png)](http://www.versioneye.com/user/projects/51dc359a7c1df6000200bc60)


# Blinkist::Core

The blinkist core gem is the database access of all the blinkist server projects and provides all the basic functionality needed for blinkists business logic. It:

* Is Based on MongoId;
* Is providing models for other projects to be embedded;
* Is completely tested;

## Installation

Add this line to your application's Gemfile:

    gem "blinkist-core", "3.0.0"

And then execute:

    $ bundle install

## Information

### Setup

Copy the `.env.template` file to `.env.development` to make this work properly with your local development application.

### The Blinkist wiki

The Blinkist Wiki has lots of additional information about Blinkist::Core project including many explenations on why we've chosen the provided structure of models.

https://blinkist.atlassian.net/

### Bug reports

If you discover a problem with the core gem, we would like to know about it.

https://blinkist.atlassian.net/

### Applications using this gem

There are a few applications available on GitHub that use this gem. For usage see:

* https://github.com/blinkist/blinkist-api
* https://github.com/blinkist/blinkist-web
* https://github.com/blinkist/blinkist-admin
* https://github.com/blinkist/blinkist-job-system
* https://github.com/blinkist/blinkist-ms-evernote

### Dependencies

This gem uses following projects to provide all its functionality:

* https://github.com/blinkist/blinkist-model-factories

## Maintainers

* Sebastian Schleicher (https://github.com/sebastian-julius)
* Tobias Balling (https://github.com/tobiasballing)
* Paaaarov :)

## License

Copyright 2012-2013 Blinks Labs GmbH. http://blinkist.com
