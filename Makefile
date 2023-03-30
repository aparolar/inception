# Inicio del Makefile de Inception
# contraseña VM root i18914071i

COLOR			=	\033[1;94m
RESET			=	\033[0m

COMPOSE_DOCKER_FILE	=	srcs/docker-compose.yml
DOCKER_CMD		=	docker-compose -f $(COMPOSE_DOCKER_FILE)

SLEEP_TIME		=	5

all:	up

up:	
	#@ srcs/requirements/nginx/conf/hosts 
	@ $(DOCKER_CMD) up -d --build
	@ sleep $(SLEEP_TIME)
	@ echo "$(COLOR)Containers are now built and running.$(RESET)"

stop:
	@ $(DOCKER_CMD) stop
	@ echo "$(COLOR)Containers have been stopped.$(RESET)"

down:
	@ $(DOCKER_CMD) down
	@ echo "$(COLOR)Containers are now down.$(RESET)"

start:
	@ $(DOCKER_CMD) start
	@ sleep $(SLEEP_TIME)
	@ echo "$(COLOR)Containers are now running.$(RESET)"

ps:
	@ $(DOCKER_CMD) ps

logs:
	@ $(DOCKER_CMD) logs

re:	stop up

rmvols:
	@ docker volume rm srcs_wp_vol
	@ docker volume rm srcs_db_vol

gitpush:
	git status
	git add .
	git status
	git commit -m "update"
	git push

.phony:	all up
