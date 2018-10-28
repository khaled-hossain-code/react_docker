FROM node:8.12.0 as builder
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install
COPY . .
EXPOSE 3000
CMD npm run build

FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html