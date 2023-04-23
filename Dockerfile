
FROM node:12.7.0-alpine

WORKDIR '/app'
RUN yarn
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
