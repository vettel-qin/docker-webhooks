# FROM nginx

# EXPOSE 80

FROM node:alpine as builder

WORKDIR /code

ADD package.json /code

# RUN npm add yarn -g

RUN yarn

ADD . /code

RUN yarn build

FROM nginx:alpine

COPY --from=builder /code/build /usr/share/nginx/html

EXPOSE 80