.PHONY: build-base-image
build-base-image:
	docker build  -t 'getdirectus/directus-base-layer:v0.0.6' directus-base-layer/

.PHONY: run-base-image
run-base-image:
	docker run -p 8080:8080 -it getdirectus/directus-base-layer

.PHONY: build-6.3-image
build-6.3-image:
		docker build  -t 'getdirectus/directus:6.3' directus/6.3/

.PHONY: run-6.3-image
run-6.3-image:
	docker run -p 8080:8080 -it getdirectus/directus:6.3
