FROM daocloud.io/node:7.5.0
# replace this with your application's default port


# RUN npm --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist install
# RUN npm install http-server -g

MAINTAINER Zheng Jianwen "zhengjianwen@outlook.com"

COPY . /mapp
WORKDIR /mapp

# RUN /bin/sh -c 'eval `ssh-agent -s` && ssh-add config/id_rsa_p'
# RUN mkdir ~/.ssh && touch ~/.ssh/known_hosts
# RUN ssh-keyscan -t rsa git.coding.net >> ~/.ssh/known_hosts


# RUN ssh-keygen -R coding.net
# RUN echo 221.193.246.64 git.coding.net >> /etc/hosts
# ADD config/id_rsa_p /root/.ssh
RUN git clone git@git.coding.net:yiqifenxiang/share-api.git /var/www/src/fe
# RUN git clone git@github.com:Jianwen-Zheng/docker-for-node.git ./index/t
# RUN exec ssh-agent bash && ssh-add config/id_rsa_docker
# RUN eval `ssh-agent -s`

# RUN ssh-add /root/.ssh/id_rsa_p

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
ADD config/sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y --force-yes nginx

RUN mkdir -p /var/www/html/website

RUN mkdir -p /var/www/src/fe
# RUN git clone git@git.coding.net:lesscode/share-fe.git ./index
# RUN mkdir -p /var/www/src/admin
# RUN git clone git@git.coding.net:lesscode/share-admin.git /var/www/src/admin

ADD nginx/global.conf /etc/nginx/conf.d/
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD nginx/g2.conf /etc/nginx/g2.confs

RUN npm --registry=https://registry.npm.taobao.org --disturl=https://npm.taobao.org/dist install
CMD ["sh","init.sh"]

EXPOSE 9999
EXPOSE 81
EXPOSE 82