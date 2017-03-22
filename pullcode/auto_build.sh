#! /bin/bash


git reset --hard origin/master
git clean -f
git pull origin master

cp ../index/* /var/www/html/website
# npm install
# npm run start