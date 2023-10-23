NAME := tamakiii-sandbox/php-sandbox
CONTAINER ?= $(shell docker ps -qf ancestor="$(NAME)")

%:
	docker exec -it $(CONTAINER) make $@

build:
	docker build -t $(NAME) ..

run:
	docker run --rm \
		-v $(realpath ..):/app \
		-w /app \
		-p 8080:80 \
		$(NAME) \
		make app

stop:
	docker stop $(CONTAINER)

sh:
	docker exec -it $(CONTAINER) sh

logs:
	docker logs -f $(CONTAINER)
