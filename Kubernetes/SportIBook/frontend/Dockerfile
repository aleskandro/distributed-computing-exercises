# base image
FROM node:10.15.3

# set working directory
RUN mkdir /code
WORKDIR /code

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json ./package.json
RUN npm install -g yarn
RUN npm install -g @angular/cli
RUN yarn install

# add app (for production)
# COPY . /usr/src/app

# start app
CMD ng serve --host 0.0.0.0 --disable-host-check

