
DB_USER=root
DB_PASS=password
DB_NAME=seniorMediaTest
DB_CONTAINER=senior-media-db

build:
	@docker-compose up -d --build

import-data:
	@docker exec -i $(DB_CONTAINER) mysql -u $(DB_USER) -p$(DB_PASS) $(DB_NAME) < db.sql

up:
	@docker-compose up -d

down:
	@docker-compose down