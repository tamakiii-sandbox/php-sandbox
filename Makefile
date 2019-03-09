install: \
	vendor/

composer.phar:
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	php composer-setup.php
	php -r "unlink('composer-setup.php');"

vendor/: composer.phar
	php composer.phar install

app:
	php -S 0.0.0.0:80 src

test: install
	vendor/bin/phpunit --colors=always

coverage: install
	php -dzend_extension=xdebug.so vendor/phpunit/phpunit/phpunit --coverage-text --coverage-html=storage/coverage/html --colors=never

clean:
	rm composer.phar
	rm -rf vendor/
