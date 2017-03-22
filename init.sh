#!/bin/sh

service nginx start
nginx -g "daemon off;"
npm start
