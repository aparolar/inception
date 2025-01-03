# Inicio del Makefile de Inception
# contraseña aparolar a18914071a

COLOR				=	\033[1;94m
RESET				=	\033[0m

USER_HOME			=	/home/aparolar
COMPOSE_DOCKER_FILE	=	srcs/docker-compose.yml
DOCKER_CMD			=	docker-compose -f $(COMPOSE_DOCKER_FILE)

SLEEP_TIME			=	5

all:	up

up:	
	@if [ ! -f $(USER_HOME)/data ] ; then \
		mkdir "$(USER_HOME)/data" ; \
	fi
	@if [ ! -f $(USER_HOME)/data/wp ] ; then \
		mkdir "$(USER_HOME)/data/wp" ; \
	fi
	@if [ ! -f $(USER_HOME)/data/db ] ; then \
		mkdir "$(USER_HOME)/data/db" ; \
	fi
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
	@ echo "$(COLOR)Erase volumes.$(RESET)"
	@ docker volume rm srcs_wp_vol
	@ docker volume rm srcs_db_vol

rmimgs:
	@ echo "$(COLOR)Erase images.$(RESET)"
	@ for img in $(shell docker images -q); do \
		echo "erasing image $$img" ; \
		docker rmi -f $$img ; \
	done

rmcont:
	@ echo "$(COLOR)Erase containers.$(RESET)"
	@ for cont in $(shell docker ps -q); do \
		echo "Erasing container $$cont" ; \
		docker rm -f $$cont ; \
	done
rmall:
	@ echo "$(COLOR)Erase proyect files.$(RESET)"
	@ rm -rf $(USER_HOME)/data
	@ rm -rf $$PWD
	@ cd

clean: down rmcont rmvols rmimgs
	@ echo "$(COLOR)All clean.$(RESET)"

fclean: clean rmall

listimg:
	docker images

gitpush:
	git status
	git add .
	git status
	git commit -m "update"
	git push

.phony:	all up
