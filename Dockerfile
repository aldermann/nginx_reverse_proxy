ARG NODE_VERSION=12.10.0

FROM node:${NODE_VERSION}-alpine as build
ARG DUMB_INIT_VERSION

WORKDIR /home/app

RUN apk add --no-cache build-base python2 yarn 
ADD src /home/app/src
ADD package.json /home/app/
RUN yarn install && yarn build && yarn cache clean 

FROM node:${NODE_VERSION}-alpine
WORKDIR /home/app
COPY --from=build /home/app /home/app
EXPOSE 8000
CMD ["yarn", "start:prod"]