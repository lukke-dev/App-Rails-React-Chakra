docker:
	sudo rm rails-api/tmp/pids/server.pid -f
	sudo docker compose -f docker-compose.yml up --remove-orphans

bash:
	sudo docker compose -f docker-compose.yml exec personal_rails_api /bin/bash

build:
	sudo docker compose -f docker-compose.yml build

bundle:
	echo "*** bundle install ***"
	sudo docker container exec personal_rails_api bash -c "cd rails-api && bundle install"

migrate:
	echo "*** create and migrate database ***"
	sudo docker container exec personal_rails_api bash -c "cd rails-api && rake db:create"
	sudo docker container exec personal_rails_api bash -c "cd rails-api && rake db:migrate"

debug:
	sudo docker attach personal_rails_api
