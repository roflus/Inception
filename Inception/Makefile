all: up

# Create and start containers
up:
		docker-compose -f ./srcs/docker-compose.yml up -d

# Stop and remove containers, networks
down:
		docker-compose -f ./srcs/docker-compose.yml down

# stop services
stop:
		docker-compose -f ./srcs/docker-compose.yml stop

# start services
start:
		docker-compose -f ./srcs/docker-compose.yml start

restart:
		docker-compose -f ./srcs/docker-compose.yml rest

clean: down
		docker rmi mariadb nginx wordpress
		docker volume rm mariadb wordpress
open:
		@open -a Docker
		@echo "Open Docker"
close:
		@osascript -e 'quit app "Docker"'
		@echo "Close Docker" 		
status:
		@docker ps