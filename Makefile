NAME := tamakiii-sandbox/php-sandbox
CONTAINER ?= $(shell docker ps -qf ancestor="$(NAME)")

build:
	docker build -t $(NAME) .

run:
	docker run --rm \
		-v $(realpath .):/app \
		-w /app \
		-p 8080:80 \
		$(NAME) \
		php -S 0.0.0.0:80 -t src

sh:
	docker run -it --entrypoint=sh $(NAME)
