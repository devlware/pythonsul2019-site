FROM node:12-alpine
RUN mkdir /src
WORKDIR /src
COPY . /src
RUN apk add  \
    autoconf \
    automake \
    bash \
    g++ \
    libc6-compat \
    libjpeg-turbo-dev \
    libpng-dev \
    make \
    libtool \
    nasm

ENV NODE_ENV=production
RUN npm install --production && npm i startbootstrap-scrolling-nav && npm install webpack -g && npm run production
EXPOSE 8080
CMD ["npm", "run", "serve"] 