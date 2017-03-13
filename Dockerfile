FROM daocloud.io/node
# replace this with your application's default port

COPY . /mapp
WORKDIR /mapp
RUN npm --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist install

EXPOSE 3000

# CMD ["npm", "start"]
# RUN npm start