#!/bin/bash

docker run -d -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -v ~/.volume/learning-mysql:/var/lib/mysql mysql:8
