install:
	bundle install

lint:
	bundle exec rubocop

fix:
	bundle exec rubocop -A

.PHONY: test