FROM node:slim as builder

# Create app directory
WORKDIR /Users/vamsee/practicess/nodeDocker

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json /Users/vamsee/practicess/nodeDocker/

RUN npm cache verify
RUN npm install
# If you are building your code for production
# RUN npm install --only=production

COPY ./docker/nginx.conf /etc/nginx

# Bundle app source
COPY . /Users/vamsee/practicess/nodeDocker

# generate build
RUN npm run build

# base image
FROM nginx:1.13.9-alpine

# copy artifact build from the 'build environment'
COPY --from=builder /Users/vamsee/practicess/nodeDocker/dist /usr/share/nginx/html

COPY docker/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80
STOPSIGNAL SIGQUIT

ENTRYPOINT ["docker-entrypoint.sh"]

# run nginx
CMD ["nginx", "-g", "daemon off;"]

#EXPOSE 4200

#CMD [ "npm", "start" ]
