.PHONY: db-init permissions

DATA_DIR=_data
CONFIG_DIR=_config
TOR_USER=800

build:
	docker-compose build

init:
	mkdir -p ${DATA_DIR}/tor ${DATA_DIR}/mysql
	mkdir -p ${CONFIG_DIR}
	sudo chown ${TOR_USER}:${TOR_USER} -R ${DATA_DIR}/tor

db-init:
	docker-compose exec -T db mysql -uroot -proot torstatus < torstatus/install.sql

update:
	docker-compose exec -T torstatus perl /srv/torstatus/tns_update.pl
