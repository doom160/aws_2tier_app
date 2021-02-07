FROM node:alpine
WORKDIR /usr/src/app
COPY . .
RUN npm i
EXPOSE 3000
ENTRYPOINT ["./entrypoint.sh"]
