#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
FROM node:10-alpine

WORKDIR /app

RUN chown -R node:node /app

#install all packages in package.json
COPY package*.json ./

USER node

RUN npm install

#expose port 8080 and run the app
EXPOSE 8080

COPY . .

CMD ["npm", "start"]
