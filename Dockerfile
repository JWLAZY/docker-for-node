FROM daocloud.io/node:7.5.0-onbuild
# replace this with your application's default port

COPY . /mapp
WORKDIR /mapp
# RUN npm --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist install
# RUN npm install http-server -g

MAINTAINER Zheng Jianwen "zhengjianwen@outlook.com"
# ENV REFRESHED_AT 2016-12-05
RUN apt-get -y update && apt-get install -y nginx
RUN mkdir -p /var/www/html/website
ADD nginx/global.conf /etc/nginx/conf.d/
ADD nginx/nginx.conf /etc/nginx/nginx.conf

# RUN nginx -g "daemon off;"

CMD ["nginx", "-g","daemon off;"]

EXPOSE 80


# CMD ['http-server']
# EXPOSE 3000

# CMD ["npm", "start"]
# RUN npm start