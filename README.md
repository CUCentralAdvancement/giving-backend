# Giving Backend

Backend for the giving.cu.edu site.

## Local Dev Setup

Local development is done via Docker and `asdf`...need to link to install 
instructions for both.

- Docker Compose - https://docs.docker.com/compose/install/
- asdf - https://asdf-vm.com/#/

```bash
# Use asdf to set local tool versions in .tool-versions.
# Example for Ruby: `asdf shell ruby 2.7.3`

# Install Ruby dependencies.
bundle

# Install node dependencies.
yarn

# Spin up Docker containers.
yarn services:start

# Create and seed database.
yarn db:create

# Start dev server.
yarn dev
```

## Updating Ruby

The current version of Ruby listed in `Gemfile` and `.ruby-version` will determine 
how Bundler adds and installs Gems. You will occasionally need to update Ruby to 
the latest version, and Heroku nicely points out old Ruby versions in build logs.

The syntax for updating versions is simple, but for some reason, it's different 
across the three Ruby version config files...why is there three? I know one is 
for `asdf` versioning...and more info on that should be added here once written up.

```
# Gemfile
ruby '2.7.3'

# .ruby-version
ruby-2.7.3

# .tool-versions
ruby 2.7.3
```

## Auth0

User authentication is handled via Auth0 and two Gems:

- `omniauth-auth0` - Provides Auth0 integration to `omniauth` as well as that 
  base gem.
- `omniauth-rails_csrf_protection` - Provides a form token used in omniauth 
  communication.
  
Integration followed official Auth0 documentation:
https://auth0.com/docs/quickstart/webapp/rails
  
### Initialization and Routes

Omniauth is a Rack-based middleware that gets initialized in the 
`/config/initializers/auth0.rb` file. No changes were made from those
listed in the Auth0 tutorial guide. Similarly, `/config/routes.rb` has the 
same routes with the same controller actions as mentioned in the tutorial.

### Controller and View Integration

For the application developer, there are several useful functions that can
be used to control authorization to routes and in views.

- `authenticate_user!` can be used in any controller as a `before_action`.
- `user_signed_in?` can be used in views conditionally showing/hiding
user interface items based on authentication status.
  
### Further Work

A `User` model needs to be created to attach the user session info to. That 
model would include a way to associate accounts of which Auth0 would be one.

## Database

The database is served via Heroku Postgres...blah blah

- Need to add emoji support to this and the order processing app.

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
