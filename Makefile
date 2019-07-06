.build: Dockerfile http.toml https.toml init.sh
	docker-compose build
	touch .build

shell: .build
	docker-compose run --rm traefik sh

run: .build
	docker-compose run --rm traefik
