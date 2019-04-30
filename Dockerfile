# base image
FROM node:8.15

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY build /usr/src/app/
RUN npm install -g serve


# start app
CMD ["serve", "-s", "-l", "3000"]