# Project Title

Intro sentence on the purpose of the project.

The readme will flow from the perspective of a new developer being on-boarded to your project. Each project
readme template should be filled in by the dev who created the project, and it needs to be finished before
other developers should be asked to work on any project.

## Features

It helps to orient the new developer to the main purpose of the app. It will also help you as you start
working on the features since the only records you'll have exist in issue comments.

...

## Stack and Services

Describe stack...

The first step of the local development install instructions is to set up environmental variables for the
services being used. Some install scripts require those variables to be present when ran so it's important to
list out the different services a developer will need to connect to.

Most of the environmental variables will be listed in Heroku's admin UI, but make sure to mention where to
find the config info.

Services:

- Something for media hosting
- Something for search
- Something for background worker/queue processing
- I think you get the point...

## Local Development Setup

Local development is done via Docker and `asdf`...need to link to install instructions for both.

- Docker Compose - https://docs.docker.com/compose/install/
- asdf - https://asdf-vm.com/#/

```bash
# Copy example env file and get creds from Heroku.
cp .env.example .env

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

The current version of Ruby listed in `Gemfile` and `.ruby-version` will determine how Bundler adds and
installs Gems. You will occasionally need to update Ruby to the latest version, and Heroku nicely points out
old Ruby versions in build logs.

The syntax for updating versions is simple, but for some reason, it's different across the three Ruby version
config files...why is there three? I know one is for `asdf` versioning...and more info on that should be added
here once written up.

```
# Gemfile
ruby '2.7.3'

# .ruby-version
ruby-2.7.3

# .tool-versions
ruby 2.7.3
```

As you can see, `yarn` is the standard for running commands. Rather than using different tools to run shell
commands, standardizing on `yarn` allows us to better group commands and run them similarly on Heroku and
locally.

...should list the command prefixes:

- deps - Things to do with package management
- services - Things to do with Docker.
- db - Things to do with data.
- app - Things to do with the application server

After you finish writing the section, clone down your repository in a fresh directory to see if you can follow
the instructions and get a working site. Often times, there's one or two key instructions left out in the
first draft.

## Testing

Now that the developer has the project setup, server running locally, and they are connected to any necessary
services, they should run the available tests and make sure they are green. Furthermore, some sort of CI
testing should be set up to run on each pull request to the main branch.

...need to link to testing methods docs/repo.

## Deployment

Now that the developer has green tests and everything running, they are about ready to work on issues in the
backlog. The last step is to make sure they know how to deploy the application. You should include everything
around hosting and deploying the app.

Things to include:

- Review app process and testing. Any caveats vs. staging and production?
- Any release scripts and how they work.
- How to monitor the deployment via addons and logs.
- Any troubleshooting tips related to current/past deployment issues.
- What is the SLA for service disruption resolution?
- Ways to run "smoke tests" after a deploy, if that makes sense.

### Recreating Heroku Databases

Locally, you can reset the database by running one command that combines several others: `yarn db:reset`.

On Heroku, however, you can't simply create databases with predefined names. Instead it is best to reset
the database manually and then run some commands.

You can use the Heroku CLI to reset the database, but you can also do it through the UI and end up at some
page like: https://data.heroku.com/datastores/6f5b95a3-66d3-41d0-90e9-b515290d7f71#administration. There
under "Settings" you can reset the database.

To seed the database run the following commands:

```bash
# Use updated db schema.
heroku run rake db:migrate -a giving-backend-staging

# Add seed data.
heroku run rake db:seed -a giving-backend-staging

# Reindex search for frontend.
heroku run rake algoliasearch:reindex -a giving-backend-staging 
```

## Help Articles And Additional Docs

Help articles on how to edit the resources:

- [Redirects](docs/help/redirects.md) - These are "vanity URLs" that are hosted in a Redis instance within 
  another application.

### Fund Model Types

Need to better document the Fund model and the caveats about license plate and write-in funds. The D7 version 
of the site had three different content types for funds: donation, license plate, and write-in. The "donation" 
type covers all but four discrete funds: three license plate funds and the write-in one.

The D7 version of the site had a "fund type" field that is no longer used; however, that field is exactly 
what is needed to differentiate the funds for frontend rendering needs. We'll start with the three types 
and add more if needed.

Fund Types:
- **default** - Most funds will use the default frontend components built to demo the migrated UI.
- **license_plate** - Three funds from different campuses will share this type. The Giving Form differs by 
  fixing the donation at $50 and only asking for the "name on title" of the car. 
- **write_in** - This fund has no allocation code or campus and the same Giving Form with the addition of a 
  comments section. 

Since the funds don't have the same schema in D7, the fund types will be added during the seeding process.

## Production Checklist

Heroku has [a list of recommended steps to take](https://devcenter.heroku.com/articles/production-check)
before launching an application into production. The Digital Engagement team also has a few recommendations to
complete before launching anything into production.

Copy the checklist here and complete all items before launching the app into production on Heroku.

GitHub:

- [ ] Dependabot set up for timely dependency updates
- [ ] System and unit tests run on each PR before being merged into the main branch
- [ ] Code linting runs on each PR before being merged into the main branch
- [ ] Linters or scanners show no accessibility issues while using the app
- [ ] CodeQL or similar scanner for preventing sensitive info in commits
- [ ] Alerts for security issues sent to Slack alerts channel
- [ ] Readme template is completely filled in including this production checklist
- [ ] Security policy filled out for reporting project issues relates to security.

Heroku's Production Environment:

- [ ] At least two dynos each for web and workers are running in production for redundancy
- [ ] If database, use a production tier database
- [ ] Backup schedule and DR for databases, media assets
- [ ] App monitoring tool and alerts set up
- [ ] Log monitoring tool and alerts set up
- [ ] SLA agreed upon and written down for service uptime and maintenance
