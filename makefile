.PHONY: build-base-image
build-base-image:
	docker build -t 'directus/directus-base-image' directus-php-fpm/

.PHONY: build-test-image
build-full-image:
	docker build -t 'directus/directus-php-fpm-mysql' php-fpm-cady-mysql/
