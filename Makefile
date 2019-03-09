NAME := tamakiii-sandbox/php-sandbox

build:
	docker build -t $(NAME) .

run:
	docker run --rm $(NAME) php

sh:
	docker run -it --entrypoint=sh $(NAME)
