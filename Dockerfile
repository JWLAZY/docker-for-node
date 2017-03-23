FROM daocloud.io/node:7.5.0
# replace this with your application's default port


# RUN npm --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist install
# RUN npm install http-server -g

MAINTAINER Zheng Jianwen "zhengjianwen@outlook.com"

COPY . /mapp
WORKDIR /mapp

ADD config/id_rsa_p /root/.ssh
RUN exec ssh-agent bash && ssh-add config/id_rsa_docker
# RUN eval `ssh-agent -s`

# RUN ssh-add /root/.ssh/id_rsa_p

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
ADD config/sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y --force-yes nginx

RUN mkdir -p /var/www/html/website

# RUN mkdir -p /var/www/src/fe
# RUN git clone git@git.coding.net:lesscode/share-fe.git /var/www/src/fe
# RUN mkdir -p /var/www/src/admin
# RUN git clone git@git.coding.net:lesscode/share-admin.git /var/www/src/admin

ADD nginx/global.conf /etc/nginx/conf.d/
ADD nginx/nginx.conf /etc/nginx/nginx.conf

RUN npm --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist install
CMD ["sh","init.sh"]
EXPOSE 9999
EXPOSE 80