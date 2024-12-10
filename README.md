# README

# Setup
rvm install 3.0.6
rvm use 3.0.6@quotes --create
bundle
bin/setup
bin/dev

visit:
http://localhost:3000

# REST API
GET /api/v1/quotes
GET /api/v1/quotes/:id
GET /api/v1/users
GET /api/v1/users/:id

# GraphQL API
/graphiql
