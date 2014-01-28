#!/bin/bash

export DATABASE_USERNAME=""
export DATABASE_PASSWORD=""
export DATABASE_HOST=""
export DATABASE_PORT=""

cd /kandan/ && bundle exec thin start
