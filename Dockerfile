

FROM daocloud.io/node:5
# replace this with your application's default port

wget http://download.redis.io/releases/redis-2.8.17.tar.gz
tar xzf redis-2.8.17.tar.gz
cd redis-2.8.17
make
redis-server &
COPY . /mapp
WORKDIR /mapp
# RUN npm install -g nodemon
RUN npm --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist install

EXPOSE 3000

# CMD ["npm", "start"]
# RUN npm start