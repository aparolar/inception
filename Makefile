# Inicio del Makefile de Inception

COLOR			=	\033[1;94m
RESET_COLOR		=	\033[0m

COMPOSE_DOCKER_FILE	=	srcs/docker-compose.yml

SLEEP_TIME		=	5

all:	up

up:	
	@ docker-compose -f $(COMPOSE_DOCKER_FILE) up -d --build
	@ sleep $(SLEEP_TIME)
	@ echo "$(COLOR)Containers are now built and running.$(RESET)"

stop:
	@ docker-compose -f $(COMPOSE_DOCKER_FILE) stop
	@ echo "$(COLOR)Containers have been stopped.$(RESET)"

down:
	@ docker-compose -f $(COMPOSE_DOCKER_FILE) down
	@ echo "$(COLOR)Containers are now down.$(RESET)"

start:
	@ docker-compose -f $(COMPOSE_DOCKER_FILE) start
	@ sleep $(SLEEP_TIME)
	@ echo "$(COLOR)Containers are now running.$(RESET)"

ps:
	@ docker-compose -f $(COMPOSE_DOCKER_FILE) ps

re:	stop up

.phony:	all up
