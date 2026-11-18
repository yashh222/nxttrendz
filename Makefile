
.PHONY: build up down logs migrate superuser shell

IMAGE_NAME = nxttrendz-backend

build:
	docker compose build

up:
	docker compose up -d --build

down:
	docker compose down

logs:
	docker compose logs -f backend

migrate:
	docker compose exec backend python manage.py migrate

superuser:
	docker compose exec backend python manage.py createsuperuser

shell:
	docker compose exec backend bash

.PHONY: build up down logs migrate superuser shell push

DOCKER_ID = yashdev1
IMAGE_NAME = nxttrendz-backend
VERSION = v1

push-backend:
	docker tag $(IMAGE_NAME) $(DOCKER_ID)/$(IMAGE_NAME):$(VERSION)
	docker tag $(IMAGE_NAME) $(DOCKER_ID)/$(IMAGE_NAME):latest
	docker push $(DOCKER_ID)/$(IMAGE_NAME):$(VERSION)
	docker push $(DOCKER_ID)/$(IMAGE_NAME):latest
push-frontend:
	docker tag nxttrendz-frontend $(DOCKER_ID)/nxttrendz-frontend:$(VERSION)
	docker tag nxttrendz-frontend $(DOCKER_ID)/nxttrendz-frontend:latest
	docker push $(DOCKER_ID)/nxttrendz-frontend:$(VERSION)
	docker push $(DOCKER_ID)/nxttrendz-frontend:latest