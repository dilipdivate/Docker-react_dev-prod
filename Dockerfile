FROM node:16.13-alpine3.13 as build-stage

WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package*.json /app/

RUN npm install --silent

COPY . ./

# start app
CMD ["npm", "start"]

# Build and tag the Docker image:
# $ docker build -t react-new:dev .

# $ docker run \                                   --creates and runs a new container from the image
#     -it \                                        --interactive mode
#     --rm \                                       --removes the container and volumes after container exits
#     -v ${PWD}:/app \                             --mounts the code in container at /app
#     -v /app/node_modules \                       -- we want container version of node module 
#     -p 3001:3000 \                               -- exposes 3000 to other docker containers on same N/W and 3001 to host 
#     -e CHOKIDAR_USEPOLLING=true \                -- enables a polling mechanism so that hot-reloading will work
#     react-new:dev    
# what if you add -itd