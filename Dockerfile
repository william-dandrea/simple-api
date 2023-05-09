###############################
#        PRODUCTION           #
###############################
FROM node:20-alpine AS production

# Create app directory
WORKDIR /usr/src/app

# Set the node environment to production mode
ENV NODE_ENV production

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install app dependencies
RUN npm install -g @nestjs/cli
RUN npm install --omit=dev

# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
RUN npm run build

RUN rm -rf src && \
    rm -rf test && \
    rm -rf coverage && \
    rm -rf *.json && \
    rm -rf *.js && \
    rm -rf *.lock && \
    rm -rf *.md && \
    rm -rf *.sh && \
    rm -rf *.yml && \
    rm -rf *.yaml && \
    rm -rf Dockerfile && \
    rm -rf .dockerignore && \
    rm -rf .prettierrc && \
    rm -rf .eslintrc.js && \
    rm -rf .idea && \
    rm -rf .git && \
    rm -rf .gitignore

USER node
# Start the server using the production build
CMD [ "node", "dist/main.js" ]

###############################
#         DEVELOPMENT         #
###############################
FROM node:20-alpine As development

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=development

COPY . .

RUN npm run build
