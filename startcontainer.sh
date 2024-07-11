#!/bin/bash

service php8.3-fpm start
/usr/local/ptylr/nginx/sbin/nginx
tail -f /usr/local/ptylr/nginx/logs/access.log
