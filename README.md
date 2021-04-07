# Giving Backend

Backend for the giving.cu.edu site.

## Local Dev Setup

Local development is done via Docker and `asdf`...need to link to install instructions for both.

- Docker - 
- asdf - link to ADR, maybe? https://asdf-vm.com/#/

```bash
# Spin up Docker containers.
yarn services:start

# Create and seed database.
yarn db:create

# Start dev server.
yarn dev
```

## Updating Ruby

The current version of Ruby listed in `Gemfile` and `.ruby-version` will determine how Bundler adds and installs Gems. You
will occasionally need to update Ruby to the latest version, and Heroku nicely points out old Ruby versions in build logs.

The syntax for updating versions is simple, but for some reason, it's different across the three Ruby version config files...
why is there three? I know one is for `asdf` versioning...and more info on that should be added here once written up.

```
# Gemfile
ruby '2.7.3'

# .ruby-version
ruby-2.7.3

# .tool-versions
ruby 2.7.3
```

---

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
