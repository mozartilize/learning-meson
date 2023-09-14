#!/bin/bash

apt update
apt install -y \
	postgresql \
	postgresql-postgis \
	etcd-server \
	patroni \
	python3-psycopg

systemctl stop postgresql.service
systemctl disable postgresql.service