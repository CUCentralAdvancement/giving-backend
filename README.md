# Project Title

Intro sentence on the purpose of the project.

The readme will flow from the perspective of a new developer being on-boarded to your project. Each
project readme template should be filled in by the dev who created the project, and it needs to be
finished before other developers should be asked to work on any project.

## Features

It helps to orient the new developer to the main purpose of the app. It will also help you as you
start working on the features since the only records you'll have exist in issue comments.

...

## Stack and Services

Describe stack...

The first step of the local development install instructions is to set up environmental variables
for the services being used. Some install scripts require those variables to be present when ran so
it's important to list out the different services a developer will need to connect to.

Most of the environmental variables will be listed in Heroku's admin UI, but make sure to mention
where to find the config info.

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

The current version of Ruby listed in `Gemfile` and `.ruby-version` will determine how Bundler adds
and installs Gems. You will occasionally need to update Ruby to the latest version, and Heroku
nicely points out old Ruby versions in build logs.

The syntax for updating versions is simple, but for some reason, it's different across the three
Ruby version config files...why is there three? I know one is for `asdf` versioning...and more info
on that should be added here once written up.

```
# Gemfile
ruby '2.7.3'

# .ruby-version
ruby-2.7.3

# .tool-versions
ruby 2.7.3
```

As you can see, `yarn` is the standard for running commands. Rather than using different tools to
run shell commands, standardizing on `yarn` allows us to better group commands and run them
similarly on Heroku and locally.

...should list the command prefixes:

- deps - Things to do with package management
- services - Things to do with Docker.
- db - Things to do with data.
- app - Things to do with the application server

After you finish writing the section, clone down your repository in a fresh directory to see if you
can follow the instructions and get a working site. Often times, there's one or two key instructions
left out in the first draft.

## Testing

Now that the developer has the project setup, server running locally, and they are connected to any
necessary services, they should run the available tests and make sure they are green. Furthermore,
some sort of CI testing should be set up to run on each pull request to the main branch.

...need to link to testing methods docs/repo.

## Deployment

Now that the developer has green tests and everything running, they are about ready to work on
issues in the backlog. The last step is to make sure they know how to deploy the application. You
should include everything around hosting and deploying the app.

Things to include:

- Review app process and testing. Any caveats vs. staging and production?
- Any release scripts and how they work.
- How to monitor the deployment via addons and logs.
- Any troubleshooting tips related to current/past deployment issues.
- What is the SLA for service disruption resolution?
- Ways to run "smoke tests" after a deploy, if that makes sense.

## Additional Docs

You'll inevitably have more information to write down about all the topics above. For instance,
detailing how you use a hosted search addon can be in its own documentation article linked to the
section where you first describe the "Services" used in the project.

Place these docs in a `/docs` section of your repo.

### Fund Model Slugs 

Need to document the Fund model and the rules for creating slugs and avoiding the license plate 
and write-in routes.

Reserved slugs:
- "write-fund"
- "cu-anschutz-alumni-license-plate-fund"
- "cu-scholarship-license-plate-fund"
- "cu-denver-alumni-license-plate-program"

## Production Checklist

Heroku
has [a list of recommended steps to take](https://devcenter.heroku.com/articles/production-check)
before launching an application into production. The Digital Engagement team also has a few
recommendations to complete before launching anything into production.

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
