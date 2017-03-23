#!/bin/sh

echo '收到推送通知了'
# git reset --hard origin/master
# git clean -f
git pull origin master
# cd /var/www/src/fe && git pull origin master && touch test.txt
# git pull origin master

# 提交本地代码到nginx的文件夹中
cp ../index/* /var/www/html/website



# npm install
# npm run start