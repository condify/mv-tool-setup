up:
	@if [ ! -f config.yml ]; then cp config.example.yml config.yml; fi
	docker compose up app -d

down:
	docker compose down

pytest:
	@if [ ! -f config.yml ]; then cp config.example.yml config.yml; fi
	docker compose up pytest
	docker compose down pytest --rmi all

cleanup:
	docker compose down --volumes --rmi all

