#base image
FROM node:alpine

#install dependancies
WORKDIR /usr/loginapp
COPY ./package.json ./
RUN npm run config set proxy null
RUN npm run config set https-proxy null
RUN npm config set registry http://registry.npmjs.org/
RUN npm install
COPY ./ ./

## Add the wait script to the image
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /wait
RUN chmod +x /wait

#start-up command
CMD /wait && npm start
