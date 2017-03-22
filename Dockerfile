FROM daocloud.io/node:7.5.0-onbuild
# replace this with your application's default port

COPY . /mapp
WORKDIR /mapp
# RUN npm --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist install
RUN npm install http-server -g

# CMD ['http-server']
EXPOSE 3000

# CMD ["npm", "start"]
# RUN npm start