.PHONY: build-base-image
build-base-image:
	docker build  -t 'directus/directus-base-image' directus-php-fpm/

.PHONY: run-base-image
run-base-image:
	docker run -p 8080:8080 -it directus/directus-base-image 

.PHONY: build-test-image
build-full-image:
	docker build -t 'directus/directus-php-fpm-mysql' php-fpm-cady-mysql/
