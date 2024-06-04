# Use the latest Ruby image as the base
FROM ruby:3.1.2

# Set up the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    postgresql-client

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the Rails application into the container
COPY . .

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]