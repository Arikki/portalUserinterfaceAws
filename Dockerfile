FROM node:14.17 as build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.19

COPY ./nginx/nginx.conf/ /etc/nginx/nginx.conf

COPY --from=build /app/dist/project/ /usr/share/nginx/html/