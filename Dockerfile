# Will build later, now we are just using the dev version. 
ARG NODE_VERSION=12.10.0

FROM node:${NODE_VERSION}-alpine 
ARG DUMB_INIT_VERSION

WORKDIR /home/app

RUN apk add --no-cache build-base python2 yarn 
ADD src /home/app/src
ADD package.json /home/app/
RUN yarn install && yarn cache clean 

EXPOSE 8000
CMD ["yarn", "start:dev"]