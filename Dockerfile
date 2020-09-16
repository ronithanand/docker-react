FROM node:alpine
  WORKDIR '/app'
  COPY package.json .
  RUN npm install
  COPY . .
  RUN npm run build
 
  FROM nginx

  EXPOSE 8080

  COPY --from=/app/build /usr/share/nginx/html