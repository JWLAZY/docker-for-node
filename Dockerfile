FROM daocloud.io/node:7.5.0-onbuild
# replace this with your application's default port


# RUN npm --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist install
# RUN npm install http-server -g

MAINTAINER Zheng Jianwen "zhengjianwen@outlook.com"

COPY . /mapp
WORKDIR /mapp

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
ADD config/sources.list /etc/apt/sources.list
RUN apt-get update 
run apt-get install -y --force-yes nginx

RUN mkdir -p /var/www/html/website

ADD nginx/global.conf /etc/nginx/conf.d/
ADD nginx/nginx.conf /etc/nginx/nginx.conf

CMD service nginx start
CMD nginx -g "daemon off;"

EXPOSE 9999
EXPOSE 80


# CMD ['http-server']
# EXPOSE 3000

# CMD ["npm", "start"]
# RUN npm start