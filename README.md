# ecommerce-rails


## Getting Started

`git clone <repo URL>`    

* The repo URL (HTTP / SSH / GitHub CLI) is available via the Code button on the main repo page.


## Ruby Version

3.4.3 (see `.ruby-version`)


## Dependencies

Install Bundler if you don't already have it:

`gem install bundler`


## Setup

To get set up:

`bin/setup`

This installs dependencies, prepares the database, and starts the development server.

To manually seed the database:

`bin/rails db:seed`

## System Dependencies

* SQLite3 (version 3.8.0 or higher) used as the database. No separate database server setup required.
* libvips: used by the `image_processing` gem for Active Storage image variants.
  * macOS `brew install vips`
  * Ubuntu/Debian: `sudo apt-get install libvips`
* Node/yarn not required. JS is handled by importmap-rails & CSS by Tailwind CSS gem.


## Running the Application Locally

Starts the development server:

`bin/dev`

Uses Foreman to run processes defined in `Procfile.dev`.

Application runs at:

`http://localhost:3000`


## Testing

To run the test suite:

`bin/rails test`


## Configuration

No environment variables required for the default local setup.

Deployment requires: 

`RAILS_MASTER_KEY` (see Deployment below).


## Deployment

Application designed to be deployed using Docker + Kamal.
Configuration located in `config/deploy.yml`.

**Required secret:**

- `RAILS_MASTER_KEY`

Decrypts Rails credentials. 
Kamal reads it from `config/master.key` by default. (gitignored, see `.kamal/secrets`).


To deploy:

`bin/kamal deploy`