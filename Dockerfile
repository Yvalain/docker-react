# Specify the base image
FROM node:20-alpine as builder
WORKDIR /usr/app

# Install some dependencies
COPY package.json .
RUN npm install
COPY . .

# Default command 
RUN npm run build

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html