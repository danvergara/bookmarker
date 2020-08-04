FROM ruby:2.7

RUN apt-get update -qq \
	&& apt-get install -y netcat build-essential libpq-dev nodejs

WORKDIR /app 

# RUN addgroup --system app && adduser --system --group app

COPY Gemfile* ./

RUN bundle install

COPY . .

# Remove a potentially pre-existing server.pid for Rails
# RUN rm -rf /app/tmp/pids/server.pid 

# Add a script to be executed every time the container starts
ENTRYPOINT ["/app/entrypoint.sh"]
EXPOSE 3000

