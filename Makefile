PRIVATE_REGISTRY_URL=ro.lan:5000
DOCKER_IMAGE=eggclub/bilyric
VERSION=0.1

#all: up

build:
	docker build --tag=${DOCKER_IMAGE}:${VERSION} .

push:
	docker push ${DOCKER_IMAGE}:${VERSION}

build-dev:
	docker build --tag=${DOCKER_IMAGE}:${VERSION}-dev -f Dockerfile.dev .

#
#build-for-private-registry:
#	docker build --tag=${PRIVATE_REGISTRY_URL}/${DOCKER_IMAGE}:${VERSION} .
#
#push-for-private-registry:
#	docker push ${PRIVATE_REGISTRY_URL}/${DOCKER_IMAGE}:${VERSION}
#
#up:
#	docker-compose up -d
#
#stop:
#	docker-compose stop
#
#start:
#	docker-compose start

#sstart:
#	docker-compose start elasticsearch redis
#
#test:
#	docker exec -it onftaapi_onfta_api_1 python3 manage.py test
#
#restart:
#	docker-compose restart onfta_api
#
#pull:
#	git pull && docker-compose restart onfta_api
#
#restart-nginx:
#	docker exec -it nginx nginx -s reload
#
#rmcache:
#	docker exec -it onftaapi_redis_1 redis-cli flushall
#
#clean:
#	docker-compose stop && docker-compose rm --force && sudo rm -rf elasticsearch-data
#
#reup:
#	docker-compose stop && docker-compose rm --force && sudo rm -rf elasticsearch-data && docker-compose up -d
#
#exec:
#	docker exec -it onftaapi_${c}_1 bash
#
#watch:
#	docker exec -it onftaapi_elasticsearch_1 watch -t -d "curl -s 'localhost:9200/_cat/indices?v'"
#
#merge:
#	git checkout master && git merge develop && git push origin master && git checkout develop
#
#re-makemigration:
#	find ./onfta_api -regextype posix-egrep -regex ".*/migrations/00.*py" && find ./onfta_api -regextype posix-egrep -regex ".*/migrations/00.*py" -delete && python3 ./manage.py makemigrations
#
#deploy-test:
#	git push && fab set_host:onfta.dev deploy
#
#deploy-prod:
#	make merge && fab set_host:onfta.com deploy

#re-migration:
#	python manage.py migrate --fake onfta_event zero && find ./admin_dashboard/onfta_event -path "*/migrations/*.py" -not -name "__init__.py" -delete && python manage.py makemigrations && python manage.py migrate --fake-initial


all: up

up:
	docker-compose up -d

stop:
	docker-compose stop

start:
	docker-compose start

restart:
	docker-compose restart web

