NAME := tamakiii-sandbox/php-sandbox
CONTAINER ?= $(shell docker ps -qf ancestor="$(NAME)")

install: \
	composer.phar

composer.phar:
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	php composer-setup.php
	php -r "unlink('composer-setup.php');"

test:
	vendor/bin/phpunit --colors=always

coverage:
	php -dzend_extension=xdebug.so vendor/phpunit/phpunit/phpunit --coverage-text --coverage-html=storage/coverage/html --colors=never

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
	docker exec -it $(CONTAINER) sh

logs:
	docker logs -f $(CONTAINER)

clear:
	rm composer.phar
